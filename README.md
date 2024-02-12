# DependencyChecker

![Static Badge](https://img.shields.io/badge/Xcode-15.2.0-blue)
![Static Badge](https://img.shields.io/badge/swift-5.9.2-blue)

## About

**DependencyChecker** will be used to inform about released updates of packages inside your project. With different `configurations` you are able to decide which messages you want to receive. This package is similar to **kiliankoes** [swift-outdated](https://github.com/kiliankoe/swift-outdated).

## Installation

```
mint install alexanderpuchta/DependencyChecker
```

## Usage

I would recommend to add 

```
mint run DependencyChecker
```

to your `Build Phases` of your project. This will show necessary update messages at your **issue navigator**.

### Configuration

To get this checker working you need to save a `dependency-checker.yml` inside your root directory of your project. You will find an example file [**here**](https://github.com/alexanderpuchta/DependencyChecker/tree/main/example/dependency-checker.yml).

```yaml
locations:
  - invisible # checking invisible .package.resolved files
  - visible # checking for Package.resolved files
  - shared # checking for Package.resolved files within shared directory
  - workspace # checking for Package.resolved files inside your workspace directory (default location)
messages:
  - major # major update level will be displayed
  - minor # minor update level will be displayed
  - patch # patch update level will be displayed
versions:
  - v1 # checking for package v1 file (currently not supported.)
  - v2 # checking for package v2 file
```

### Levels

- Major 🚀
    Those messages will inform you about new major releases. This means you are able to change your current resolved package version. e.g. you are using `9.3.1` and the new packages got a release with version number `10.0.1`.

- Minor 🦺
    Minor messages will tell you that there are new versions available which can be updated via `Update to latest package versions`. e.g. `9.3.1` and there is a newer version `9.4.0`.

- Patch 🩹
    Patch messages will tell you that there has been a new fix available. e.g. `9.3.1` got a new update to `9.3.2`.

### Examples

```
warning: 🚀 package 'permissionskit (9.2.2)' got a new MAJOR update. version '10.0.1' is available.
warning: 🦺 package 'swiftui-introspect (1.0.2)' got a new MINOR update. version '1.1.2' is available.
warning: 🩹 package 'swiftui-introspect (1.1.0)' got a new PATCH update. version '1.1.2' is available
```