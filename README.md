# Motivation

I wanted to investigate the approaches to automate the process of new targets creation in multi-targets application

# My approach

## Initial setup 
Firstly, [XcodeGen](https://github.com/yonaskolb/XcodeGen) for Xcode project setup.  
I suppose that every target would have a similar configuration.  

## igen script
After that I use my self-written shell script, that helps with new targets creation.  
To use it, just type  
```bash
./igen <path_to_targets_congif.yaml> <path_to_xcodegen_project.yaml>
```
So, all you need is to keep the targets' names in one .yaml file.  
When you want to add a new target, you just append it's name to this .yaml.  

You can also add `inherit` your target from some existing target.  
In this case, script will copy all configurations in project.yaml from existing target to new target.

Additionally, you can `steal` a list of existing files or directories. In this case, script will just copy everyting using `cp -R ...`

# Example

Directory iNote contains the pre-setupped project with two targets. Each target has unique UI & UX.  
They use different colors, images, presentation of notes (`UITableView` vs `UICollectionView`),  
different logic of navigation (`push` vs `present`).  

Common files are located in `COMMOM` directory, target specific files are located in `{TARGET_NAME}` directory.  
My iNote.yaml (file with targets config) looks like this:
```yaml
project: iNote

targets:
    Alpha:
    Beta:
```

If I want to add a new target, I can modify the iNote.yaml
```yaml
project: iNote

targets:
    Alpha:
    Beta:
    Gamma:
        steals:
            - iNote/Alpha/Resources/
            - iNote/Beta/Modules/
        inherit: Alpha
```
run the script
```bash
./igen iNote.yaml project.yml
```
and regenarate the project
```bash
xcode generate
open *.xcodeproj
```
And now, iNote project has one additional target that is mix of the existing ones - it uses Recources (UI) from Alpha and Modules (UX) from Beta

# Summary
Initial setup with project.yaml for XcodeGen and the use of self-written igen script allows you to create new targets in just several seconds.
