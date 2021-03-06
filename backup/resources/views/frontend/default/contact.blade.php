@extends('frontend.default.master')
@section('content')
<!-- PAGE SECTION START -->
<div class="page-section section pt-100 pb-100">
    <div class="container">
        <div class="row">
            <div class="contact-info col-md-4 col-xs-12 mb-40">
                <h3>Thông tin liên hệ</h3>
                
                <p><i class="pe-7s-map-marker"></i><span>123 West Street, Melbourne Victoria <br>3000 Australia</span></p>

                <p><i class="pe-7s-call"></i><span>Phone : +061012345678</span><span>Fax : +0061012345678</span></p>

                <p><i class="pe-7s-mail"></i><a href="#">Contact@domain.com</a><a href="#">Support@domain.com</a></p>
                
                <div class="contact-social">
                    <a href="#"><i class="fa fa-facebook"></i></a>
                    <a href="#"><i class="fa fa-twitter"></i></a>
                    <a href="#"><i class="fa fa-linkedin"></i></a>
                    <a href="#"><i class="fa fa-pinterest"></i></a>
                    <a href="#"><i class="fa fa-instagram"></i></a>
                </div>
                
            </div>
            <div class="contact-form col-md-8 col-xs-12 mb-40">
                <h3>Form liên hệ</h3>
                <form id="contact-form" action="mail.php" method="post">
                    <div class="row">
                        <div class="col-sm-4 col-xs-12 mb-20">
                            <label for="name">Your Name</label>
                            <input id="name" name="name" type="text">
                        </div>
                        <div class="col-sm-4 col-xs-12 mb-20">
                            <label for="email">Your Email</label>
                            <input id="email" name="email" type="email">
                        </div>
                        <div class="col-sm-4 col-xs-12 mb-20">
                            <label for="subject">Subject</label>
                            <input id="subject" name="subject" type="text">
                        </div>
                        <div class="col-xs-12 mb-20">
                            <label for="message">Message</label>
                            <textarea name="message" id="message"></textarea>
                        </div>
                        <div class="col-xs-12">
                            <button type="submit" class="btn btn-primary btn-ajax" data-ajax="act=contact|type=contact"> Gửi </button>
                        </div>
                    </div>
                </form>
                <p class="form-messege"></p>
            </div>
            <div class="col-xs-12 mt-40">
                <input id="origin-input" class="controls" type="text" placeholder="Enter an origin location">
                <input id="destination-input" class="controls" type="text" placeholder="Enter a destination location">
                <div id="mode-selector" class="controls">
                    <input type="radio" name="type" id="changemode-walking" checked="checked">
                    <label for="changemode-walking">Walking</label>

                    <input type="radio" name="type" id="changemode-transit">
                    <label for="changemode-transit">Transit</label>

                    <input type="radio" name="type" id="changemode-driving">
                    <label for="changemode-driving">Driving</label>
                </div>
                <div id="contact-map"></div>
            </div>
        </div>
    </div>
</div>
<!-- PAGE SECTION END -->
@endsection

@section('css_head')
<style>
.controls {margin-top: 10px;border: 1px solid transparent;border-radius: 2px 0 0 2px;box-sizing: border-box;-moz-box-sizing: border-box;height: 32px;outline: none;box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
}

#origin-input,
#destination-input {background-color: #fff;font-family: Roboto;font-size: 15px;font-weight: 300;margin-left: 12px;padding: 0 11px 0 13px;text-overflow: ellipsis;width: 200px;
}
#origin-input:focus,
#destination-input:focus {border-color: #4d90fe;}
#mode-selector {color: #fff;background-color: #4d90fe;margin-left: 12px;padding: 5px 11px 0px 11px;}
#mode-selector label {font-family: Roboto;font-size: 13px;font-weight: 300;}
</style>
@endsection

@section('script_bottom')

<script>
    function initMap() {
        var map = new google.maps.Map(document.getElementById('contact-map'), {
            mapTypeControl: false,
            center: {lat: -33.8688, lng: 151.2195},
            zoom: 13
        });

        new AutocompleteDirectionsHandler(map);
    }

    /**
    * @constructor
    */
    function AutocompleteDirectionsHandler(map) {
        this.map = map;
        this.originPlaceId = null;
        this.destinationPlaceId = null;
        this.travelMode = 'WALKING';
        var originInput = document.getElementById('origin-input');
        var destinationInput = document.getElementById('destination-input');
        var modeSelector = document.getElementById('mode-selector');
        this.directionsService = new google.maps.DirectionsService;
        this.directionsDisplay = new google.maps.DirectionsRenderer;
        this.directionsDisplay.setMap(map);

        var originAutocomplete = new google.maps.places.Autocomplete(
        originInput, {placeIdOnly: true});
        var destinationAutocomplete = new google.maps.places.Autocomplete(
        destinationInput, {placeIdOnly: true});

        this.setupClickListener('changemode-walking', 'WALKING');
        this.setupClickListener('changemode-transit', 'TRANSIT');
        this.setupClickListener('changemode-driving', 'DRIVING');

        this.setupPlaceChangedListener(originAutocomplete, 'ORIG');
        this.setupPlaceChangedListener(destinationAutocomplete, 'DEST');

        this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(originInput);
        this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(destinationInput);
        this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(modeSelector);
    }

    // Sets a listener on a radio button to change the filter type on Places
    // Autocomplete.
    AutocompleteDirectionsHandler.prototype.setupClickListener = function(id, mode) {
        var radioButton = document.getElementById(id);
        var me = this;
        radioButton.addEventListener('click', function() {
            me.travelMode = mode;
            me.route();
        });
    };

    AutocompleteDirectionsHandler.prototype.setupPlaceChangedListener = function(autocomplete, mode) {
        var me = this;
        autocomplete.bindTo('bounds', this.map);
        autocomplete.addListener('place_changed', function() {
            var place = autocomplete.getPlace();
            if (!place.place_id) {
                window.alert("Please select an option from the dropdown list.");
                return;
            }
            if (mode === 'ORIG') {
                me.originPlaceId = place.place_id;
            } else {
                me.destinationPlaceId = place.place_id;
            }
            me.route();
        });

    };

    AutocompleteDirectionsHandler.prototype.route = function() {
        if (!this.originPlaceId || !this.destinationPlaceId) {
            return;
        }
        var me = this;

        this.directionsService.route({
            origin: {'placeId': this.originPlaceId},
            destination: {'placeId': this.destinationPlaceId},
            travelMode: this.travelMode
        }, function(response, status) {
            if (status === 'OK') {
                me.directionsDisplay.setDirections(response);
            } else {
                window.alert('Directions request failed due to ' + status);
            }
        });
    };

</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAmtm5XL4qL8zyjf6lGxz6-9hkeu45-UiI&libraries=places&callback=initMap"></script>
@endsection