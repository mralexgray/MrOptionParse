/**
 *\file MrOption.h
 *\author Zachary Sarver
 *\date October 2009
 */

@class NSString, MrCallback;

/**
 *\brief A class that represents options.
 */
@interface MrOption : NSObject
{
@protected
  NSString* short;
  NSString* long;
  NSString* action;
  NSString* type;
  NSString* isRequired;
  MrCallback* callback;
  id defaultValue;
  id value;
}

-(id)initWithShort: (NSString*)short longForm: (NSString*)long withAction: (NSString*)action ofType: (NSString*)type isRequired: (BOOL)req usingCallback: (MrCallback*)cb;
-(NSString*)short;
-(NSString*)long;
-(void)defaultValue: (id)value;
-(id)value;
