//
//  TouchdownTests.m
//  TouchdownTests
//
//  Created by Jeff Remer on 7/16/11.
//  Copyright 2011 Widgetbox, Inc. All rights reserved.
//

#import "TouchdownTests.h"
#import "Touchdown.h"

@implementation TouchdownTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testMarkdownToHtml
{    
    NSString *html = [Touchdown htmlFromMarkdown: @"# Foo\n_bar_\n"];
    STAssertEqualObjects(html, @"<h1>Foo</h1>\n\n<p><em>bar</em>\n", @"# Foo -> <h1>Foo");
}

@end
