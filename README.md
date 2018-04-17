# Makers Academy Week 1 - Boris Bikes Project

## The Challenge

Let's go back several years, to the days when there were no Boris Bikes. Imagine that you're a junior developer. Transport for London, the body responsible for delivery of a new bike system, come to you with a plan: a network of docking stations and bikes that anyone can use. They want you to build a program that will emulate all the docking stations, bikes, and infrastructure (repair staff, and so on) required to make their dream a reality.

To help structure your work, here are 22 challenges. They all build on one another. They require you to research things, to get stuck, and to find your own solutions. This is on purpose. A developer is a 'knowledge worker' - someone who will spend the majority of their time researching and learning how to solve problems. It'll suck for a bit, but with practice, you will get faster: and there's no better feeling than finding the answer to a problem that's been standing in your way for hours.

## Overview

This is a simple example where a bike object can be docked and released from a docking station. Mimicking Boris Bikes.

If all the docks in the station are full then no further bikes can be added. Conversely if the docking station is empty no bikes can be removed


## What next

Functionality should be added to cater for broken bikes eg if a bike is broken it can only be removed by an engineer.

## What could have been done better

This work was done in week 1 in the course and not completed due to time constraints/competing requirements.

* The unit tests in docking_station are not independant of the Bike object - a mocked Bike object should have been injected.

* There are no feature tests - perhaps due to time constraints

* At this point in development the Bike object is not really necessary as it only has one method which is not used - I was thinking ahead but the implementation to date would have been simpler without it.

## Setting up bikes docking stations and users
```
git clone https://github.com/philb56/boris_bikes2.git
```
...and if not installed already
```
gem install rspec
```

## How to run tests
CD to boris_bikes2 then at the prompt:

rspec

Should yield:
```
Bike
  should respond to #working?
  is working

DockingStation
  should respond to #release_bike
  should respond to #dock_bike
  bike can be docked
  bike exists
  can pass capacity when DockingStation.new
  capacity=15 when DockingStation.new(15)
  capacity=DEFAULT_CAPACITY when DockingStation.new
  #dock
    raises an error when full - default
  initialization
    has a variable capacity

Finished in 0.022 seconds (files took 0.14852 seconds to load)
11 examples, 0 failures
```

## Examples of how to run in IRB

#### For each example below
CD to boris_bikes2 and run irb

Require ./lib/bike.rb and ./lib/docking_station.rb"

Then:
```
irb(main):009:0> bike = Bike.new
=> #<Bike:0x281d258>
irb(main):010:0> dock = DockingStation.new
=> #<DockingStation:0x28c39e0 @capacity=20, @bikes=[]>
```

#### 1. Dock a bike then release it. Releasing a further bike will raise error 'No bike available'
```
irb(main):015:0> dock.dock_bike(bike)
=> [#<Bike:0x281d258>]
irb(main):016:0> bike2 = dock.release_bike
=> #<Bike:0x281d258>
irb(main):017:0> bike3 = dock.release_bike
RuntimeError: No bike available
        from C:/Users/Phil_2/projects/testarea/boris_bikes2/lib/docking_station.
rb:12:in `release_bike'
        from (irb):17
        from C:/RailsInstaller/Ruby2.3.3/bin/irb.cmd:19:in `<main>'
irb(main):018:0>
```

#### 2. Fill the dock up to capacity then try to add another bike - should raise error 'Too many bikes'
```
irb(main):019:0> DockingStation::DEFAULT_CAPACITY.times{dock.dock_bike(Bike.ne>
=> 20
irb(main):020:0> dock.dock_bike(bike)
RuntimeError: Too many bikes
        from C:/Users/Phil_2/projects/testarea/boris_bikes2/lib/docking_station.
rb:17:in `dock_bike'
        from (irb):20
        from C:/RailsInstaller/Ruby2.3.3/bin/irb.cmd:19:in `<main>'
irb(main):021:0>
```
