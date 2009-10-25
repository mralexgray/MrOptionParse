/**
 *\file MrOption.m
 *\author Zachary Sarver
 *\date October 2009
 */

#import "MrOption.h"

@implementation MrOption
-(id)initWithShort: (NSString*)sht longForm: (NSString*)lng withAction: (NSString*)actn ofType: (NSString*)tp isRequired: (BOOL)req usingCallback: (MrCallback*)cb
{
  if (self = [super init])
    {
      short = sht;
      long = lng;
      action = actn;
      type = tp;
      isRequired = req;
      callback = cb;
    }
  return self;
}

-(NSString*)short
{
  return short;
}

-(NSString*)long
{
  return long;
}

-(void)defaultValue: (id)val
{
  defaultValue = val;
}

-(id)value
{
  return value;
}

-(void)value: (id)val
{
  value = val;
}

-(NSString*)regex
{
  return regex;
}

-(void)regex: (NSString*)rx
{
  regex = rx;
}
@end
