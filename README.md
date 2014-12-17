EpochConverter
==============

Epoch Converter for iOS and OSX


## Basic usage

### Init

Init with current day (eg. 2014-01-01 00:00:00) - remember to set your time zone, defualt is Europe/Warsaw.

```objective-c
EpochConverter *converter = [EpochConverter alloc] init];
```

Init with specific time

```objective-c
EpochConverter *converter = [EpochConverter alloc] initWithEpoch:(NSInteger)];
```

### Properties

```objective-c
@property (strong, nonatomic, readonly) NSNumber * baseEpoch;
```