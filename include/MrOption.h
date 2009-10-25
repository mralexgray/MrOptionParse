/**
 *\file MrOption.h
 *\author Zachary Sarver
 *\date October 2009
 */

@class NSString, MrCallback;

/**
 *\brief A class that represents options.
 *\details Asside from storing and providing nice access to options
 *and values, MrOption can also do some nice option checking. It can
 *do a simple check based on type (string, int, float supported) and
 *it can also do more advanced regex checking, which checks a string
 *against a certain regex, useful for verifying urls and other complex
 *input.
 */
@interface MrOption : NSObject
{
@protected
  NSString* short; /**< Short form of the option, e.g. -f*/
  NSString* long; /**< Long form of the option, e.g. --fullscreen*/
  NSString* action;  /**< What action should be taken, e.g. store*/
  NSString* type; /**< Type of option, e.g. string or int*/
  NSString* isRequired; /**< Whether or not the "option" is
			   required. Kinda funny terminology. Is it
			   really an option if it isn't optional?*/
  NSString* regex; /**< Regex to match against if type is regex*/
  NSString* explanation; /**< Explanation that appears for this
			    option in a usage message, e.g. launch in
			    fullscreen mode*/
  NSString* name; /**< Name to go along with an option, e.g. fullscreen*/
  MrCallback* callback; /**< Callback object to use when type is callback*/
  id defaultValue; /**< Default value of the option*/
  id value; /**< Current value of the option*/
}

-(id)initWithShort: (NSString*)short longForm: (NSString*)long withAction: (NSString*)action ofType: (NSString*)type isRequired: (BOOL)req usingCallback: (MrCallback*)cb;
-(void)explanation: (NSString*)expl andName: (NSString*)moniker;
-(NSString*)name;
-(NSString*)explanation;
-(NSString*)short;
-(NSString*)long;
-(void)defaultValue: (id)val;
-(id)value;
-(void)value: (id)val;
-(BOOL)isValid: (id)val;
-(NSString*)regex;
-(void)regex: (NSString*)rx;

@end
