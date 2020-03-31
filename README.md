# git_for_ROS
Example repo for how you might set up git for a catkin_ws in ROS 

### Disclaimer... 
This is the way I have found useful, since I often use submodules, there are probably other and better ways to use Git with catkin_ws!

## Initialising the Git Repo

I use the src folder as the location for my Git repository.
I have made the repos for the CARMA robot visible as an example, see [CARMA repo](https://github.com/EEEManchester/custom_jackal_description)

Then, if I want to clone the project onto a new machine (e.g., a new version of CARMA) I would do the following:

```bash
mkdir ~/catkin_carma/
cd ~/catkin_carma
git clone --recursive https://github.com/EEEManchester/jackal_catkin_src.git ./src #recursive is required for submodules - see below, this command clones the repo into a folder called ./src
cd ./src
git branch -a
git checkout origin/carma  #to move to the carma branch  located at the remote
```
This may be followed by some setup steps/running some scripts, see below.

But ultimately, once my src folder and other setup steps are completed:

```bash
cd ~/catkin_carma
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

You can also use submodules to add code from public repos e.g., 

```bash
git submodule add https://github.com/tu-darmstadt-ros-pkg/hector_slam.git 
```

## Config files, setup steps and .bashrc

Currently on the Jackal, a bash script is used to setup environmental variables, see source-jackal-env.sh in this repo for full example.

Using environmental variables in a setup script to change URDF configuration:
For example, using environmental variables set in source-jackal-env.sh, we can change the configuration of the URDF for the robot:

```xml

  <xacro:if value="$(optenv CARMA 0)">
    <xacro:include filename="$(find custom_jackal_description)/urdf/carma/carma_urdf.xacro"/>
  </xacro:if>

  <xacro:if value="$(optenv TORONE 0)">
    <xacro:include filename="$(find custom_jackal_description)/urdf/torone/torone_urdf.xacro" />
  </xacro:if>
```



## Using branches  - a simplified example workflow.

[Branching and merging](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging)

```
git branch new_feature
git checkout new_feature
git add -A #or a new set of files
git commit -m 'add feature for ...' # we could look into using templates for commit messages
git checkout master
git merge new_feature
git branch -d new_feature #If fast-forward merge was successful, may need a bit more caution if multiple people are working on master
git push
```

