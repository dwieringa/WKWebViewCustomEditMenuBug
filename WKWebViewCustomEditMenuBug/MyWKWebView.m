//
//  MyWKWebView.m
//  WKWebViewCustomEditMenuBug
//
//  Created by David Wieringa on 10/20/15.
//  Copyright © 2015 Userwise Solutions. All rights reserved.
//

#import "MyWKWebView.h"

@implementation MyWKWebView

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    // KNOWN WKWEBVIEW BUG: http://stackoverflow.com/questions/26046098/wkwebview-and-uimenucontroller

    NSLog(@"CHECKING CAN PERFORM ACTION : %@", NSStringFromSelector(action));

    if (action == @selector(delete:))
    {
        // adding Delete as test (works)
        return YES;
    }
    
    // trying to remove everything else (does NOT work for Copy, Define, Share...)
    return NO;
}

@end
