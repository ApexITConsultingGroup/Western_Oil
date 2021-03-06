/*
 Copyright 2009-2015 Urban Airship Inc. All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:

 1. Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.

 2. Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.

 THIS SOFTWARE IS PROVIDED BY THE URBAN AIRSHIP INC ``AS IS'' AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
 EVENT SHALL URBAN AIRSHIP INC OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "MessageCenterViewController.h"

@implementation MessageCenterViewController

- (void)awakeFromNib {
    UADefaultMessageCenterStyle *style = [UADefaultMessageCenterStyle style];

    UIFont *robotoLight = [UIFont fontWithName:@"Roboto-Light" size:12.0];
    UIFont *robotoBold = [UIFont fontWithName:@"Roboto-Bold" size:13.0];
    UIFont *robotoRegular = [UIFont fontWithName:@"Roboto-Regular" size:17.0];

    style.navigationBarColor = [UIColor colorWithRed:0.988 green:0.694 blue:0.106 alpha:1];
    style.titleColor = [UIColor colorWithRed:0.039 green:0.341 blue:0.490 alpha:1];
    style.tintColor = [UIColor colorWithRed:0.039 green:0.341 blue:0.490 alpha:1];

    style.titleFont = robotoRegular;
    style.cellTitleFont = robotoBold;
    style.cellDateFont = robotoLight;

    self.style = style;
}

- (void)displayMessage:(UAInboxMessage *)message {
    [self.listViewController displayMessage:message];
}

@end
