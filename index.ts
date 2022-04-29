// First go to:
// https://developers.google.com/maps/documentation/javascript/examples/map-latlng-literal
// and click on "Try Sample / Google Cloud Shell"
// Then paste the content of this file in the index.ts

let map: google.maps.Map;

function initMap(): void {
  const mapOptions = {
    zoom: 8,
    center: {lat: 19.243954296872108,lng: 72.8529434603869},
  };

  map = new google.maps.Map(
    document.getElementById("map") as HTMLElement,
    mapOptions
  );

  const points = [
    {lat: 19.243954296872108,lng: 72.8529434603869},
    {lat: 19.17003394335311,lng: 72.94014743738498},
    {lat: 19.17457386937238,lng: 72.8426437780643},
    {lat: 19.147981095613833,lng: 72.87354282503213},
    {lat: 19.136304865074102,lng: 72.92778781859785},
    {lat: 19.124627808817085,lng: 72.84401706904065},
    {lat: 19.08407606953931,lng: 72.88006595716978},
    {lat: 19.077911335151516,lng: 72.86770633838265},
    {lat: 19.075964529259785,lng: 72.86083988350092},
    {lat: 19.067203619693668,lng: 72.837493936903},
    {lat: 19.056819719873673,lng: 72.83715061415892},
    {lat: 19.06233624668009,lng: 72.89139560768537},
    {lat: 19.057468731722224,lng: 72.9010086445198},
    {lat: 19.047408748158396,lng: 72.8618698516939},
    {lat: 19.022093834296356,lng: 72.85328678309173},
    {lat: 19.005864295435078,lng: 72.85912326975102},
    {lat: 18.96755630994767,lng: 72.80487827618529},
    {lat: 18.97177711308968,lng: 72.81346134478747},
    {lat: 18.965283525527823,lng: 72.82135776790146},
    {lat: 18.942878707437533,lng: 72.83783725961763},
  ];

  for (var latlong of points) {
        const marker = new google.maps.Marker({
            // The below line is equivalent to writing:
            // position: new google.maps.LatLng(-34.397, 150.644)
            position: latlong,
            map: map,
            icon: {
                url: "http://maps.google.com/mapfiles/ms/icons/blue-dot.png"
            }
        });
    }

  // You can use a LatLng literal in place of a google.maps.LatLng object when
  // creating the Marker object. Once the Marker object is instantiated, its
  // position will be available as a google.maps.LatLng object. In this case,
  // we retrieve the marker's position using the
  // google.maps.LatLng.getPosition() method.
  const infowindow = new google.maps.InfoWindow({
    content: "<p>Marker Location:" + marker.getPosition() + "</p>",
  });

  google.maps.event.addListener(marker, "click", () => {
    infowindow.open(map, marker);
  });
}

declare global {
  interface Window {
    initMap: () => void;
  }
}
window.initMap = initMap;
export {};
