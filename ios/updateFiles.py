import sys
print("Python Version:")
print(sys.version)

try:
    from pbxproj import XcodeProject
    from pbxproj.pbxsections import XCBuildConfigurationFlags
except ImportError:
    print("It looks like you don't have the python package 'pbxproj' installed.")
    print("You need to install it - you can install it via the command:")
    print("sudo -H pip install pbxproj")
    exit(1)
from pathlib import Path

project = XcodeProject.load("ButterflyTemplate.xcodeproj/project.pbxproj")
project.add_folder('./ButterflyTemplate/', target_name="ButterflyTemplate", excludes=["^.*\\.((?!swift).)*$"])
project.remove_flags(XCBuildConfigurationFlags.LIBRARY_SEARCH_PATHS, None)
project.save()


print("Successfully added project files.")
