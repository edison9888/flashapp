//
//  InstallProfileViewController.m
//  flashapp
//
//  Created by 李 电森 on 12-2-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "InstallProfileViewController.h"
#import "AppDelegate.h"

@implementation InstallProfileViewController

@synthesize installAPNButton;
@synthesize installVPNButton;
@synthesize bgView;
@synthesize label1;
@synthesize label2;
@synthesize label3;
@synthesize label4;
@synthesize label5;
@synthesize label6;
@synthesize label7;
@synthesize label8;
@synthesize imageView;
@synthesize linkButton;
@synthesize vpnHelpLabel;
@synthesize apnHelpLabel;


#pragma mark - init & destroy

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void) dealloc
{
    [installAPNButton release];
    [installVPNButton release];
    [bgView release];
    [label1 release];
    [label2 release];
    [label3 release];
    [label4 release];
    [label5 release];
    [label6 release];
    [label7 release];
    [label8 release];
    [linkButton release];
    [imageView release];
    [vpnHelpLabel release];
    [apnHelpLabel release];
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = NSLocalizedString(@"service.navItem.title" , nil);
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"帮助" style:UIBarButtonItemStyleBordered target:self action:@selector(showHelp)];
    
    [installAPNButton setBackgroundImage:[[UIImage imageNamed:@"blueButton2"] stretchableImageWithLeftCapWidth:7 topCapHeight:8] forState:UIControlStateNormal];
    [installAPNButton setTitle:@"自动开启" forState:UIControlStateNormal];

    [installVPNButton setBackgroundImage:[[UIImage imageNamed:@"grayButton"] stretchableImageWithLeftCapWidth:12 topCapHeight:15] forState:UIControlStateNormal];
    [installVPNButton setTitle:@"手动开启" forState:UIControlStateNormal];
    
    [linkButton setBackgroundImage:[[UIImage imageNamed:@"copyLinkButton.png"] stretchableImageWithLeftCapWidth:10 topCapHeight:11] forState:UIControlStateNormal];
    [linkButton setTitle:@"复制" forState:UIControlStateNormal];
    linkButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [linkButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    bgView.layer.cornerRadius = 8;
    
    label1.text = NSLocalizedString(@"pfofile.InstallProfileView.lable1", nil);
    label2.text = NSLocalizedString(@"pfofile.InstallProfileView.lable2", nil);
    label3.text = NSLocalizedString(@"pfofile.InstallProfileView.lable3", nil);
    label4.text = NSLocalizedString(@"pfofile.InstallProfileView.lable4", nil);
    label5.text = NSLocalizedString(@"pfofile.InstallProfileView.lable5", nil);
    label6.text = NSLocalizedString(@"pfofile.InstallProfileView.lable6", nil);
    label7.text = NSLocalizedString(@"pfofile.InstallProfileView.lable7", nil);
    label8.text = NSLocalizedString(@"pfofile.InstallProfileView.lable8", nil);
    
    //[linkButton setTitle: NSLocalizedString(@"pfofile.InstallProfileView.copyButton.title", nil) forState:UIControlStateNormal];
    
    UIImage* image = [UIImage imageNamed:@"ins_profile.jpg"];
    imageView.image = image;
    
    //处理4.0以下的版本
    NSString* version = [UIDevice currentDevice].systemVersion;
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:version forKey:@"systemVersion"];
    [userDefaults synchronize]; //强制写入
    
    //隐藏她们 ，1.5.5改的
    installVPNButton.hidden = YES;
    vpnHelpLabel.hidden = YES;
    apnHelpLabel.hidden = YES;
    CGRect rect = installAPNButton.frame;
    rect = CGRectMake( installAPNButton.frame.origin.x, installAPNButton.frame.origin.y + 20,
                      installAPNButton.frame.size.width, installAPNButton.frame.size.height);
    installAPNButton.frame = rect;
    [installAPNButton setTitle:@"立即开启" forState:UIControlStateNormal];
    
    rect = bgView.frame;
    rect.size.height = rect.size.height - 40;
    bgView.frame = rect;
    
} 

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.installAPNButton = nil;
    self.installVPNButton = nil;
    self.bgView = nil;
    self.label1 = nil;
    self.label2 = nil;
    self.label3 = nil;
    self.label4 = nil;
    self.label5 = nil;
    self.label6 = nil;
    self.label7 = nil;
    self.label8 = nil;
    self.imageView = nil;
    self.linkButton = nil;
    self.vpnHelpLabel = nil;
    self.apnHelpLabel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - operation method

- (IBAction) installAPNProfile:(id)sender
{
//    [UserSettings saveServiceType:@"apn"];
    if ([CHANNEL isEqualToString:@"appstore"]) {
        [AppDelegate installProfileForServiceType:@"apn" nextPage:nil apn:nil idc:nil interfable:@"1"];
    }else{
        [AppDelegate installProfileForServiceType:@"apn" nextPage:nil apn:nil idc:nil interfable:@"0"];
    }
}


- (IBAction) installVPNProfile:(id)sender
{
//    [UserSettings saveServiceType:@"vpn"];
    [AppDelegate installProfileForServiceType:@"vpn" nextPage:nil apn:nil idc:nil interfable:@"0"];
}


- (IBAction) copyInstallURL:(id)sender
{
    NSString *url ;
    NSString* inchk = [[NSUserDefaults standardUserDefaults] objectForKey:@"inchk"];
    if ( [CHANNEL isEqualToString:@"appstore"] && [@"1" isEqualToString:inchk] ) {
        url = [AppDelegate getInstallURLForServiceType:@"apn" nextPage:nil install:YES apn:nil idc:nil interfable:@"1"];
    }else{
        url = [AppDelegate getInstallURLForServiceType:@"apn" nextPage:nil install:YES apn:nil idc:nil interfable:@"0"];
    }
    
    UIPasteboard* pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = url;
    
    [AppDelegate showAlert:NSLocalizedString(@"pfofile.InstallProfileView.copyInstallURL", nil)];
}


- (void) showHelp
{
    [AppDelegate showHelp];
}


- (void) closeModal
{
    [[[AppDelegate getAppDelegate] currentNavigationController] dismissModalViewControllerAnimated:YES];
}

@end
