/**
 *\file MrOption.m
 *\author Zachary Sarver
 *\date October 2009
 */

#import "MrOption.h"

@implementation MrOption
-(id)initWithShortOption: (NSString*)sht longForm: (NSString*)lng withAction: (NSString*)actn ofType: (NSString*)tp
{
  if (self = [super init])
    {
      shortOption = sht;
      longOption = lng;
      action = actn;
      type = tp;
      isRequired = NO;
      callback = nil;
      regex = nil;
      explanation = nil;
      name = nil;
      defaultValue = nil;
      value = nil;
    }
  return self;
}

-(id)initWithShortOption: (NSString*)shrt longForm: (NSString*)lng withAction: (NSString*)actn ofType: (NSString*)tp isRequired: (BOOL)req
{
  if (self = [super init])
    {
      shortOption = sht;
      longOption = lng;
      action = actn;
      type = tp;
      isRequired = req;
      callback = nil;
      regex = nil;
      explanation = nil;
      name = nil;
      defaultValue = nil;
      value = nil;
    }
  return self;
}

-(id)initWithShortOption: (NSString*)shrt longForm: (NSString*)lng withAction: (NSString*)actn ofType: (NSString*)tp isRequired: (BOOL)req usingCallback: (MrCallback*)cb
{
  if (self = [super init])
    {
      shortOption = sht;
      longOption = lng;
      action = actn;
      type = tp;
      isRequired = req;
      callback = callback;
      regex = nil;
      explanation = nil;
      name = nil;
      defaultValue = nil;
      value = nil;
    }
  return self;
}

-(void)explanation: (NSString*)expl andName: (NSString*)moniker
{
  explanation = expl;
  name = moniker;
}

-(NSString*)name
{
  return name;
}

-(NSString*)explanation
{
  return explanation;
}
  
-(NSString*)shortOption
{
  return shortOption;
}

-(NSString*)longOption
{
  return longOption;
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

/**
 *\brief Tests for whehter or not an option is valid.
 *
 *\details It is called automatically by MrOptionParse::parse. If the
 *option is invalid, an NSException is thrown detailing the invalidity
 *(why not catch it and display a usage message? Hint hing.) Note that
 *this function can only automatically check certain automatic
 *things. Further validation should be handled in your code or via a
 *category that excends the MrOption class.
 */
-(BOOL)isValid
{
  //first, make sure there is a value if it is required
  if (isRequired && value == nil)
    {
      /**\todo Throw an exception!*/
    }
  //do some simple typechecking
  if (![type caseInsensitiveCompare:@"int"] || ![type caseInsensitiveCompare:@"float"] || ![type caseInsensitiveCompare:@"string"] || ![type caseInsensitiveCompare:@"regex"])
    {
      /**\todo Throw an exception!*/
    }
  NSScanner* scanner = [NSScanner scannerWithString: value];
  BOOL typeValid;
  //int
  if ([type caseInsensitiveCompare: @"int"])
    {
      typeValid = [scanner scanInt: nil];
    }
  else if ([type caseInsensitiveCompare: @"float"])
    {
      typeValid = [scanner scanFloat: nil];
    }
  if (!typeValid)
    {
      /**\todo Throw an exception!*/
    }
  //regex time!
  if ([type caseInsensitiveCompare: @"regex"])
    {
      /**\todo Regex checking!*/
    }
}
@end
