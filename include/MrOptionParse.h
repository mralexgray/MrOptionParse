/**
 *\file MrOptionParse.h
 *\author Zachary Sarver
 *\date October 2009
 */

#import <Foundation/Foundation.h>
#import <NSString.h>
#import <NSDictionary.h>

/**
 *\brief A friendly way to parse command line options.
 *\details Has some very easy-to-use features. For example, it will
 *automatically act on --help, --version, and so on!
 */
@interface MrOptionParse : NSObject
{
@protected
  NSString* banner;/**< The USAGE banner that appears at the
		      beginning of --help and the like*/
  NSMutableDictionary* options;/**< A dictionary of options*/
  NSString* version;/**< The version string*/
  BOOL autoprint;/**< Whether or not MrOptionParse should
		    automatically print a usage banner when an
		    invalid string of options is found*/
}

-(id)initWithArgc: (int)argc andArgv:(char*)argv withUsageAutoPrint: (BOOL)autoprint;
-(void)addOption: (NSString*)short longForm: (NSString*)long withAction: (NSString*)action ofType: (NSString*)type withKey: (NSString*)dest isRequired:(BOOL)req usingCallback:(id)cb;
-(void)setDefaultsFor: (NSString*)name withValue:(id)value;
-(void)setVersion: (NSString*)version;
-(id)getOption: (NSString*)option;
-(void)banner: (NSString*)banner;
-(int)numOptions;
-(NSString*)usageMessage;
-(void)printUsageMessage;
-(BOOL)optionExists: (NSString*)option;
-(BOOL)optionIsValid: (NSString*)valid;
-(BOOL)parse;

@end
