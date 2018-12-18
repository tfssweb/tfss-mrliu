/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
 package org.mangui.hls.flv {
    import flash.utils.ByteArray;

    /** Metadata needed to build an FLV tag. **/
    public class FLVTag {
        /** AAC Header Type ID. **/
        public static const AAC_HEADER : int = 0;
        /** AAC Data Type ID. **/
        public static const AAC_RAW : int = 1;
        /** AVC Header Type ID. **/
        public static const AVC_HEADER : int = 2;
        /** AVC Data Type ID. **/
        public static const AVC_NALU : int = 3;
        /** MP3 Data Type ID. **/
        public static const MP3_RAW : int = 4;
        /** Discontinuity Data Type ID. **/
        public static const DISCONTINUITY : int = 5;
        /** metadata Type ID. **/
        public static const METADATA : int = 6;
        /* FLV TAG TYPE */
        private static var TAG_TYPE_AUDIO : int = 8;
        private static var TAG_TYPE_VIDEO : int = 9;
        private static var TAG_TYPE_SCRIPT : int = 18;
        /** Is this a keyframe. **/
        public var keyframe : Boolean;
        /** Array with data pointers. **/
        private var pointers : Vector.<TagData> = new Vector.<TagData>();
        /** PTS of this frame. **/
        public var pts : Number;
        /** DTS of this frame. **/
        public var dts : Number;
        /** Type of FLV tag.**/
        public var type : int;

        /** Get the FLV file header. **/
        public static function getHeader() : ByteArray {
            var flv : ByteArray = new ByteArray();
            flv.length = 13;
            // "F" + "L" + "V".
            flv.writeByte(0x46);
            flv.writeByte(0x4C);
            flv.writeByte(0x56);
            // File version (1)
            flv.writeByte(1);
            // Audio + Video tags.
            flv.writeByte(1);
            // Length of the header.
            flv.writeUnsignedInt(9);
            // PreviousTagSize0
            flv.writeUnsignedInt(0);
            return flv;
        };

        /** Get an FLV Tag header (11 bytes). **/
        public static function getTagHeader(type : int, length : int, stamp : int) : ByteArray {
            var tag : ByteArray = new ByteArray();
            tag.length = 11;
            tag.writeByte(type);

            // Size of the tag in bytes after StreamID.
            tag.writeByte(length >> 16);
            tag.writeByte(length >> 8);
            tag.writeByte(length);
            // Timestamp (lower 24 plus upper 8)
            tag.writeByte(stamp >> 16);
            tag.writeByte(stamp >> 8);
            tag.writeByte(stamp);
            tag.writeByte(stamp >> 24);
            // StreamID (3 empty bytes)
            tag.writeByte(0);
            tag.writeByte(0);
            tag.writeByte(0);
            // All done
            return tag;
        };

        /** Save the frame data and parameters. **/
        public function FLVTag(typ : int, stp_p : Number, stp_d : Number, key : Boolean) {
            type = typ;
            pts = stp_p;
            dts = stp_d;
            keyframe = key;
        }
        ;

        /** Returns the tag data. **/
        public function get data() : ByteArray {
            var array : ByteArray;
            /* following specification http://download.macromedia.com/f4v/video_file_format_spec_v10_1.pdf */

            // Render header data
            if (type == FLVTag.MP3_RAW) {
                array = getTagHeader(TAG_TYPE_AUDIO, length + 1, pts);
                // Presume MP3 is 44.1 stereo.
                array.writeByte(0x2F);
            } else if (type == AVC_HEADER || type == AVC_NALU) {
                array = getTagHeader(TAG_TYPE_VIDEO, length + 5, dts);
                // keyframe/interframe switch (0x10 / 0x20) + AVC (0x07)
                keyframe ? array.writeByte(0x17) : array.writeByte(0x27);
                /* AVC Packet Type :
                0 = AVC sequence header
                1 = AVC NALU
                2 = AVC end of sequence (lower level NALU sequence ender is
                not required or supported) */
                type == AVC_HEADER ? array.writeByte(0x00) : array.writeByte(0x01);
                // CompositionTime (in ms)
                // CONFIG::LOGGING {
                // Log.info("pts:"+pts+",dts:"+dts+",delta:"+compositionTime);
                // }
                var compositionTime : Number = (pts - dts);
                array.writeByte(compositionTime >> 16);
                array.writeByte(compositionTime >> 8);
                array.writeByte(compositionTime);
            } else if (type == DISCONTINUITY || type == METADATA) {
                array = getTagHeader(FLVTag.TAG_TYPE_SCRIPT, length, pts);
            } else {
                array = getTagHeader(TAG_TYPE_AUDIO, length + 2, pts);
                // SoundFormat, -Rate, -Size, Type and Header/Raw switch.
                array.writeByte(0xAF);
                type == AAC_HEADER ? array.writeByte(0x00) : array.writeByte(0x01);
            }
            for (var i : int = 0; i < pointers.length; i++) {
                if (type == AVC_NALU) {
                    array.writeUnsignedInt(pointers[i].length);
                }
                array.writeBytes(pointers[i].array, pointers[i].start, pointers[i].length);
            }
            // Write previousTagSize and return data.
            array.writeUnsignedInt(array.length);
            return array;
        }

        /** Returns the bytesize of the frame. **/
        private function get length() : int {
            var length : int = 0;
            for (var i : int = 0; i < pointers.length; i++) {
                length += pointers[i].length;
                // Account for NAL startcode length.
                if (type == AVC_NALU) {
                    length += 4;
                }
            }
            return length;
        }
        ;

        /** push a data pointer into the frame. **/
        public function push(array : ByteArray, start : int, length : int) : void {
            pointers.push(new TagData(array, start, length));
        }
        ;

        /** Trace the contents of this tag. **/
        public function toString() : String {
            return "TAG (type: " + type + ", pts:" + pts + ", dts:" + dts + ", length:" + length + ")";
        }
        ;
    }
}

/** Tag Content **/
class TagData {
    import flash.utils.ByteArray;

    public var array : ByteArray;
    public var start : int;
    public var length : int;

    public function TagData(array : ByteArray, start : int, length : int) {
        this.array = array;
        this.start = start;
        this.length = length;
    }
}