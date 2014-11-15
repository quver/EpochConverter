EpochConverter
==============

Epoch Converter for iOS and OSX


## Basic usage

### Init

Init with current day (eg. 2014-01-01 00:00:00) Europe/Warsaw timezone

```objective-c
EpochConverter *converter = [EpochConverter alloc] init];
```

Init with specific time

```objective-c
EpochConverter *converter = [EpochConverter alloc] initWithEpoch:(NSInteger)];
```
### Instance methods

Number of day as NSInteger, where monday is first day of week, for specyfic epoch. If `nil`, method uses baseEpoch property

```objective-c
- (NSInteger)weekDayForEpoch:(NSNumber *)epoch
```

firstWeekDay and lastWeekDay returns epoch time for monday and sunday as NSNumber

```objective-c
- (NSNumber *)firstWeekDay:(NSNumber *)epoch
- (NSNumber *)lastWeekDay:(NSNumber *)epoch
```


```objective-c
- (void)changeBaseEpoch:(NSInteger)days
```
### Properties

```objective-c
@property (strong, nonatomic, readonly) NSNumber * baseEpoch;
```