# EpochConverter

[![Build Status](https://travis-ci.org/quver/EpochConverter.svg)](https://travis-ci.org/quver/EpochConverter)
[![Coverage Status](https://coveralls.io/repos/github/quver/EpochConverter/badge.svg?branch=master)](https://coveralls.io/github/quver/EpochConverter?branch=master)
[![GitHub license](https://img.shields.io/github/license/quver/EpochConverter.svg)]()
[![Platform](https://img.shields.io/cocoapods/p/EpochConverter.svg?style=flat)](http://cocoapods.org/pods/EpochConverter)
[![Version](https://img.shields.io/cocoapods/v/EpochConverter.svg?style=flat)](http://cocoapods.org/pods/EpochConverter)


## Instalation
```
pod 'EpochConverter', '~>1.0'
```

## Using

### Today case
Init with today date (eg. 1 Januar 2016 00:00:00)

```objective-c
EpochConverter *converter = [EpochConverter alloc] init];
```

### Choosen day case
```objective-c
EpochConverter *converter = [EpochConverter alloc] initWithEpoch:1451602800];
```

 
### Available properties

```objective-c
NSInteger baseEpoch;
NSInteger weekDay;
NSInteger firstWeekDay;
NSInteger lastWeekDay;
```

### Available class methods

```objective-c
+ (NSInteger)firstWeekDayForEpoch:(NSInteger)epoch;
+ (NSInteger)lastWeekDayForEpoch:(NSInteger)epoch;
+ (NSInteger)weekDayForEpoch:(NSInteger)epoch;
```

## Author

Paweł Bednorz, Quver.xyz

## License

EpochConverter is available under the MIT license. See the LICENSE file for more info
