// ----------------------------------
// Class WeatherAPI
// Wrapper for WeatherAPI.com REST API
// ----------------------------------
property _url:="http://api.weatherapi.com/v1"
property _key:=""

Class constructor($key : Text)
	This._key:=$key
	
	// Get current weather conditions
Function current($place : Text) : Object
	return This._httpRequest("/current.json"; "q="+$place)
	
	// Get weather forecast
	// $days: number of forecast days
Function forecast($place : Text; $days : Integer) : Object
	return This._httpRequest("/forecast.json"; "q="+$place+"&days="+String($days))
	
	// Search for cities or locations
Function search($query : Text) : Object
	return This._httpRequest("/search.json"; "q="+$query)
	
	// Get historical weather data
	// $date format: YYYY-MM-DD
Function history($place : Text; $date : Text) : Object
	return This._httpRequest("/history.json"; "q="+$place+"&dt="+$date)
	
	// Get weather alerts
Function alerts($place : Text) : Object
	return This._httpRequest("/alerts.json"; "q="+$place)
	
	// Get marine weather data
Function marine($place : Text) : Object
	return This._httpRequest("/marine.json"; "q="+$place)
	
	// Get future weather data (paid plans)
	// $date format: YYYY-MM-DD
Function future($place : Text; $date : Text) : Object
	return This._httpRequest("/future.json"; "q="+$place+"&dt="+$date)
	
	// Get timezone information for a location
Function timeZone($place : Text) : Object
	return This._httpRequest("/timezone.json"; "q="+$place)
	
	// Get sports events weather
Function sports($place : Text) : Object
	return This._httpRequest("/sports.json"; "q="+$place)
	
	// Get astronomy data (sunrise, sunset, moon phase)
	// $date format: YYYY-MM-DD
Function astronomy($place : Text; $date : Text) : Object
	return This._httpRequest("/astronomy.json"; "q="+$place+"&dt="+$date)
	
	// Get weather data based on IP address
Function IPLookup($place : Text) : Object
	return This._httpRequest("/ip.json"; "q="+$place)
	
	// Perform 4D.HTTPRequest to WeatherAPI
	// $api: endpoint path (ex: /current.json)
	// $param: query string parameters (without key)
Function _httpRequest($api : Text; $param : Text) : Object
	var $url : Text
	var $response : Text
	
	// Build request URL
	$url:=This._url+$api+"?key="+This._key
	If ($param#"")
		$url+="&"+$param
	End if 
	
	var $request:=4D.HTTPRequest.new($url).wait()
	If (($request.response#Null) && ($request.response.status=200))
		return {success: True; response: $request.response.body}
	Else 
		return {success: False; response: {}; errors: $request.response.body.error; status: $request.response.status; statusText: $request.response.statusText}
	End if 
	