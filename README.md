# architect_app_framework
This was written on a Mac and has not been tested on other enviroments.

This is the beginning of a framework to test transloc architect site.
The steps below assume that you have Ruby installed on the target machine.

To begin, clone the repository to the the target machine.
Open a terminal and navigate into the architect_app_framework folder.

Run 
>bundle install

After the gems are installed, rename the ./features/support/config_demo.yml to config.yml.

Edit config.yml and provide the appropriate values.

Now you should be ready to run the framework.

In architect_app_framework folder execute the following command to run the framework
>cucumber -f html >test.html
