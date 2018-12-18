/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
 package org.mangui.osmf.plugins.traits {
    import org.mangui.hls.HLS;
    import org.mangui.hls.event.HLSEvent;
    import org.osmf.traits.TimeTrait;
    
    CONFIG::LOGGING {
    import org.mangui.hls.utils.Log;
    }

    public class HLSTimeTrait extends TimeTrait {
        private var _hls : HLS;

        public function HLSTimeTrait(hls : HLS, duration : Number = 0) {
            CONFIG::LOGGING {
            Log.debug("HLSTimeTrait()");
            }
            super(duration);
            setCurrentTime(0);
            _hls = hls;
            _hls.addEventListener(HLSEvent.MEDIA_TIME, _mediaTimeHandler);
            _hls.addEventListener(HLSEvent.PLAYBACK_COMPLETE, _playbackComplete);
        }

        override public function dispose() : void {
            CONFIG::LOGGING {
            Log.debug("HLSTimeTrait:dispose");
            }
            _hls.removeEventListener(HLSEvent.MEDIA_TIME, _mediaTimeHandler);
            _hls.removeEventListener(HLSEvent.PLAYBACK_COMPLETE, _playbackComplete);
            super.dispose();
        }

        /** Update playback position/duration **/
        private function _mediaTimeHandler(event : HLSEvent) : void {
            var new_duration : Number = event.mediatime.duration;
            var new_position : Number = Math.max(0, event.mediatime.position);
            setDuration(new_duration);
            setCurrentTime(new_position);
        };

        /** playback complete handler **/
        private function _playbackComplete(event : HLSEvent) : void {
            signalComplete();
        }
    }
}