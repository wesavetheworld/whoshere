# README #

A example program that can me used to trigger Applets via the Maker service webhooks

-------

## whoshere-iftt ##

[whoshere-iftt](/whoshere-iftt/whoshere-iftt.py) is a example program that can me used to trigger [IFTT](https://ifttt.com/) Applets


Sends a web request to notify IFTT of an status change event 


### Setup IFTT Applet ###

On IFTT's "[My Applets](https://ifttt.com/my_applets)" page click "New Applet"

on
On IFTT's "[Applets create](https://ifttt.com/create)" page click "New Applet"

Click `+this`

For `Choose a service` search for `webhooks`

Click on `Webhooks`

Click `Receive a web request`

Enter `whoshere` under `Event Name`

Click `Create Trigger`

Click "+that"

For `Choose action service` pick what you want to happen ( send sms, send a 'tweet', send 'email', etc )

for a messaged you can include a `ingredient`, Value1 is the

        "value1" is the target name
        "value2" is the target current valuse 
        "value3" is the new value

for example :

Click `Create action`

Click `Finish`


##### Get Key ####

Under 'Services'

Click on `Webhooks`

Click on `Documentation`


-------
