/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
 package org.mangui.hls.constant {
    /** HLS Seek mode configuration **/
    public class HLSSeekMode {
        /** seek on segment boundary **/
        public static const SEGMENT_SEEK : String = "SEGMENT";
        /** seek on keyframe boundary **/
        public static const KEYFRAME_SEEK : String = "KEYFRAME";
        /** accurate seeking **/
        public static const ACCURATE_SEEK : String = "ACCURATE";
    }
}