<%@ Page Title="" Language="C#" MasterPageFile="~/deliveryForms/masterDeliveryBoy.Master" AutoEventWireup="true" CodeBehind="DeliBoyReadyToDelivered.aspx.cs" Inherits="OnlineClothing.deliveryForms.DeliBoyReadyToDelivered" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<!DOCTYPE html>
<html>
  <head>
    <title>Getting LatLng from a Click Event</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
  </head>
  <body>
    <div id="map"></div>
    <script>
        function initMap() {
            var myLatlng = { lat: -25.363, lng: 131.044 };

            var map = new google.maps.Map(
            document.getElementById('map'), { zoom: 4, center: myLatlng });

            // Create the initial InfoWindow.
            var infoWindow = new google.maps.InfoWindow(
            { content: 'Click the map to get Lat/Lng!', position: myLatlng });
            infoWindow.open(map);

            // Configure the click listener.
            map.addListener('click', function (mapsMouseEvent) {
                // Close the current InfoWindow.
                infoWindow.close();

                // Create a new InfoWindow.
                infoWindow = new google.maps.InfoWindow({ position: mapsMouseEvent.latLng });
                infoWindow.setContent(mapsMouseEvent.latLng.toString());
                infoWindow.open(map);
            });
        }
    </script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap">
    </script>
  </body>
</html>
<asp:TextBox ID="txtcode" runat="server"></asp:TextBox>
   <asp:Button ID="btngetcode" runat="server" Text="Get code"  />
</asp:Content>
