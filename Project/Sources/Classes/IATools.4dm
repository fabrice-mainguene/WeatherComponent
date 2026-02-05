// ----------------------------------
// Class AITools
// Creation of the description of the functions of the Weather class for the 4D AIKit tools
// ----------------------------------
property _key : Text
Class constructor($key : Text)
	This._key:=$key
	
Function all() : Collection
	var $tools:=[]
	$tools.push(This.alerts())
	$tools.push(This.astronomy())
	$tools.push(This.current())
	$tools.push(This.forecast())
	$tools.push(This.future())
	$tools.push(This.history())
	$tools.push(This.IPLookup())
	$tools.push(This.marine())
	$tools.push(This.search())
	$tools.push(This.sports())
	$tools.push(This.timeZone())
	
	return $tools
	
	// Get current weather conditions
Function current() : Object
	var $key:=This._key
	var $mytool:={tool: {}; handler: Formula(cs.Weather.new($key).current($1.place))}
	$mytool.tool.name:="current"
	$mytool.tool.description:="Current weather or realtime weather API method allows a user to get up to date current weather information in json. The data is returned as a Current Object. "
	$mytool.tool.parameters:={type: "object"; properties: {}}
	$mytool.tool.parameters.properties.place:={type: "string"; description: "city name"}
	
	return $mytool
	
	
	// Get weather forecast
	// $days: number of forecast days
Function forecast() : Object
	var $key:=This._key
	var $mytool:={tool: {}; handler: Formula(cs.Weather.new($key).forecast($1.place; $1.days))}
	$mytool.tool.name:="forecast"
	$mytool.tool.description:="Forecast weather API method returns, depending upon your subscription plan level, upto next 14 day weather forecast and weather alert as json."
	$mytool.tool.parameters:={type: "object"; properties: {}}
	$mytool.tool.parameters.properties.place:={type: "string"; description: "city name"}
	$mytool.tool.parameters.properties.days:={type: "integer"; description: "number of days"}
	
	
	return $mytool
	
	// Search for cities or locations
Function search() : Object
	var $key:=This._key
	var $mytool:={tool: {}; handler: Formula(cs.Weather.new($key).search($1.place))}
	$mytool.tool.name:="search"
	$mytool.tool.description:="returns matching cities and towns as an array of Location object."
	$mytool.tool.parameters:={type: "object"; properties: {}}
	$mytool.tool.parameters.properties.place:={type: "string"; description: "place searched"}
	
	return $mytool
	
	// Get historical weather data
	// $date format: YYYY-MM-DD
Function history() : Object
	var $key:=This._key
	var $mytool:={tool: {}; handler: Formula(cs.Weather.new($key).history($1.place; $1.date))}
	$mytool.tool.name:="history"
	$mytool.tool.description:="History weather API method returns, depending upon your subscription plan level, historical weather for a date on or after 1st Jan, 2010 as json."
	$mytool.tool.parameters:={type: "object"; properties: {}}
	$mytool.tool.parameters.properties.place:={type: "string"; description: "city name"}
	$mytool.tool.parameters.properties.date:={type: "string"; description: "date in YYYY-MM-DD format"}
	
	return $mytool
	
	// Get weather alerts
Function alerts() : Object
	var $key:=This._key
	var $mytool:={tool: {}; handler: Formula(cs.Weather.new($key).alerts($1.place))}
	$mytool.tool.name:="alerts"
	$mytool.tool.description:="Alerts API returns alerts and warnings issued by government agencies (USA, UK, Europe and Rest of the World) as an array if available for the location provided json."
	$mytool.tool.parameters:={type: "object"; properties: {}}
	$mytool.tool.parameters.properties.place:={type: "string"; description: "city name"}
	
	return $mytool
	
	// Get marine weather data
Function marine() : Object
	var $key:=This._key
	var $mytool:={tool: {}; handler: Formula(cs.Weather.new($key).marine($1.place))}
	$mytool.tool.name:="marine"
	$mytool.tool.description:="Marine weather API method returns upto next 7 day (depending upon your subscription plan level) marine and sailing weather forecast and tide data (depending upon your price plan level) as json."
	$mytool.tool.parameters:={type: "object"; properties: {}}
	$mytool.tool.parameters.properties.place:={type: "string"; description: "city name"}
	
	return $mytool
	
	// Get future weather data (paid plans)
	// $date format: YYYY-MM-DD
Function future() : Object
	var $key:=This._key
	var $mytool:={tool: {}; handler: Formula(cs.Weather.new($key).future($1.place; $1.date))}
	$mytool.tool.name:="future"
	$mytool.tool.description:="Future weather API method returns weather in a 3 hourly interval in future for a date between 14 days and 300 days from today in the future."
	$mytool.tool.parameters:={type: "object"; properties: {}}
	$mytool.tool.parameters.properties.place:={type: "string"; description: "city name"}
	$mytool.tool.parameters.properties.date:={type: "string"; description: "date in YYYY-MM-DD format"}
	
	return $mytool
	
	// Get timezone information for a location
Function timeZone() : Object
	var $key:=This._key
	var $mytool:={tool: {}; handler: Formula(cs.Weather.new($key).timeZone($1.place))}
	$mytool.tool.name:="timeZone"
	$mytool.tool.description:="Time Zone API method allows a user to get up to date time zone and local time information in json. "
	$mytool.tool.parameters:={type: "object"; properties: {}}
	$mytool.tool.parameters.properties.place:={type: "string"; description: "city name"}
	
	return $mytool
	
	// Get sports events weather
Function sports() : Object
	var $key:=This._key
	var $mytool:={tool: {}; handler: Formula(cs.Weather.new($key).sports($1.place))}
	$mytool.tool.name:="sports"
	$mytool.tool.description:="Sports API method allows a user to get listing of all upcoming sports events for football, cricket and golf in json. "
	$mytool.tool.parameters:={type: "object"; properties: {}}
	$mytool.tool.parameters.properties.place:={type: "string"; description: "city name"}
	
	return $mytool
	
	// Get astronomy data (sunrise, sunset, moon phase)
	// $date format: YYYY-MM-DD
Function astronomy() : Object
	var $key:=This._key
	var $mytool:={tool: {}; handler: Formula(cs.Weather.new($key).astronomy($1.place; $1.date))}
	$mytool.tool.name:="astronomy"
	$mytool.tool.description:="Astronomy API method allows a user to get up to date information for sunrise, sunset, moonrise, moonset, moon phase and illumination in json."
	$mytool.tool.parameters:={type: "object"; properties: {}}
	$mytool.tool.parameters.properties.place:={type: "string"; description: "city name"}
	$mytool.tool.parameters.properties.date:={type: "string"; description: "date in YYYY-MM-DD format"}
	
	return $mytool
	
	// Get weather data based on IP address
Function IPLookup() : Object
	var $key:=This._key
	var $mytool:={tool: {}; handler: Formula(cs.Weather.new($key).IPLookup($1.place))}
	$mytool.tool.name:="IPLookup"
	$mytool.tool.description:="IP Lookup API method allows a user to get up to date information for an IP address in json"
	$mytool.tool.parameters:={type: "object"; properties: {}}
	$mytool.tool.parameters.properties.place:={type: "string"; description: "city name"}
	
	return $mytool