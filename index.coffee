
# POSITION WIDGET ON SCREEN
pos_bottom		= '0px'
pos_right	= '10px'

# COLOUR SETTINGS
weatherColor	= 'WHITE'
lineColor		= 'rgba(255,255,255,0.25)'
opacityLevel	= '0.6'
labelColor	= 'rgba(185,185,185,0.5)' 
nameColor	= 'rgba(#000, 0.0)'
bkground		=  'rgba(185,185,185,0.1)'
 

command: 'curl -s "wttr.in?format="+%c+%t""'

# Update weather every 60 secs
refreshFrequency: 60000

style: """
  bottom:	#{pos_bottom}
  right:	#{pos_right}
  font-family: Helvetica Neue
  color: #{weatherColor}

  div
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 1), 0 6px 5px 0 rgba(0, 0, 0, 0.5)
    border-top: 1px solid #{lineColor}
    border-right: 1px solid #{lineColor}
    border-left: 1px solid #{lineColor}
    border-radius 5px 5px 0px 0px
    text-shadow: 0 0 1px #{bkground}
    background: #{bkground}
    font-size: 16px
    font-weight: 400
    opacity: #{opacityLevel}
    padding: 13px
    
    &:after
      content: 'WEATHER'
      position: absolute
      left: 0
      top: -14px
      font-size: 10px
      font-weight: 500
      color: #{labelColor}
   
  .weather
    font-size: 16px
    font-weight: 500
    color: #{weatherColor}
    margin: 1px
      
  img
    height: 18px
    width: 18px
    margin-bottom: -3px
    
    
"""

render: -> """
  <div><a class='weather'></a></div>
"""

update: (output,domEl) ->
  values		= output.split("\n")
  weather 		= values[0]
  computername 	= values[1]
  div			= $(domEl)

  if (weather != '')
    div.find('.weather').html(weather)
    
  		 