# git_for_ROS
example repo for how you might set up git for a catkin_ws in ROS 

## Disclaimer: This is the way I have found useful, since I often use submodules, there are probably other and better ways to use Git with catkin_ws!

## Initialising the Git Repo

I use the src folder as the location for my Git repository.
I have made the repos for CARMA visible as an example.

Then, if I want to clone the project onto a new machine (e.g., a new version of CARMA) I would do the following:

```bash
mkdir ~/catkin_CARMA/
cd ~/catkin_CARMA
git clone --recursive https://github.com/EEEManchester/jackal_catkin_src.git #recursive is required for submodules - see below
git checkout carma #to move to the carma branch
```
This may be followed by some setup steps/running some scripts, see below.

But ultimately, once my src folder and other setup steps are completed:

```bash
cd ~/catkin_CARMA
catkin_make
```

## Submodules
[Git-Tools-Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)

I tend to develop all of my code as individual repositories. 
This means that they can be integrated into multiple catkin_ws projects by using submodules.
For example, I may want to use the following package in both the CARMA and TORONE project. 

```bash
git submodule add https://github.com/EEEManchester/custom_jackal_description.git
```

This creates a file called .gitmodules, which might look something like this:

``` bash
[submodule "move_base_flex"]
	path = move_base_flex
	url = https://github.com/EEEManchester/move_base_flex.git
[submodule "yocs_velocity_smoother"]
	path = yocs_velocity_smoother
	url = https://github.com/EEEManchester/yocs_velocity_smoother.git
[submodule "jackal_move_base_config"]
	path = jackal_move_base_config
	url = https://github.com/EEEManchester/jackal_move_base_config.git
[submodule "realsense-ros"]
	path = realsense-ros
	url = https://github.com/EEEManchester/realsense-ros.git
[submodule "custom_jackal_description"]
	path = custom_jackal_description
	url = https://github.com/EEEManchester/custom_jackal_description.git
[submodule "custom_jackal_launch"]
	path = custom_jackal_launch
	url = https://github.com/EEEManchester/custom_jackal_launch.git
```

You can also use submodules to add code from public repos, but frozen at a specific commit. E.g., 

```bash
git submodule add https://github.com/tu-darmstadt-ros-pkg/hector_slam.git 
```

## Config files, setup steps and .bashrc


## Using branches

