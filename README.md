# WKWebViewCustomEditMenuBug
Illustrates a bug in WKWebView with trying to remove Copy, Define, Share... from the edit menu

Typically to alter the Edit menu, one would subclass and implement `canPerformAction:withSender:`, as shown below. However, with WKWebView, `canPerformAction:` is not being called for Copy, Define, Share....

According to this Stackoverflow post it is a known bug in WKWebView: http://stackoverflow.com/q/26046098


```
@implementation MyWKWebView

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    NSLog(@"ACTION: %@", NSStringFromSelector(action));

    if (action == @selector(delete:))
    {
        // adding Delete as test (works)
        return YES;
    }
    
    // trying to remove everything else (does NOT work for Copy, Define, Share...)
    return NO;
}

- (void)delete:(id)sender
{
    NSLog(@"Delete menu item selected");
}

@end
```

Output:

```
2015-10-20 12:28:32.864 WKWebViewCustomEditMenuBug[45804:21121480] ACTION: cut:
2015-10-20 12:28:32.865 WKWebViewCustomEditMenuBug[45804:21121480] ACTION: select:
2015-10-20 12:28:32.865 WKWebViewCustomEditMenuBug[45804:21121480] ACTION: selectAll:
2015-10-20 12:28:32.865 WKWebViewCustomEditMenuBug[45804:21121480] ACTION: paste:
2015-10-20 12:28:32.866 WKWebViewCustomEditMenuBug[45804:21121480] ACTION: delete:
2015-10-20 12:28:32.866 WKWebViewCustomEditMenuBug[45804:21121480] ACTION: _promptForReplace:
2015-10-20 12:28:32.866 WKWebViewCustomEditMenuBug[45804:21121480] ACTION: _transliterateChinese:
2015-10-20 12:28:32.867 WKWebViewCustomEditMenuBug[45804:21121480] ACTION: _showTextStyleOptions:
2015-10-20 12:28:32.907 WKWebViewCustomEditMenuBug[45804:21121480] ACTION: _addShortcut:
2015-10-20 12:28:32.908 WKWebViewCustomEditMenuBug[45804:21121480] ACTION: _accessibilitySpeak:
2015-10-20 12:28:32.908 WKWebViewCustomEditMenuBug[45804:21121480] ACTION: _accessibilitySpeakLanguageSelection:
2015-10-20 12:28:32.908 WKWebViewCustomEditMenuBug[45804:21121480] ACTION: _accessibilityPauseSpeaking:
2015-10-20 12:28:32.909 WKWebViewCustomEditMenuBug[45804:21121480] ACTION: makeTextWritingDirectionRightToLeft:
2015-10-20 12:28:32.909 WKWebViewCustomEditMenuBug[45804:21121480] ACTION: makeTextWritingDirectionLeftToRight:
```

![Screen shot](WKWebViewCustomEditMenuBug/Screen%20Shot%20of%20Edit%20Menu.png)
