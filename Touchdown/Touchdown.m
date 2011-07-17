//
//  Touchdown.m
//  Touchdown
//
//  Created by Jeff Remer on 7/16/11.
//  Copyright 2011 Widgetbox, Inc. All rights reserved.
//

#import "Touchdown.h"
#import "markdown.h"
#import "html.h"


@implementation Touchdown

+(NSString *) htmlFromMarkdown:(NSString*)markdown {
    struct buf *ib, *ob;
    const char * prose = [markdown UTF8String];
	struct mkd_renderer renderer;
    
    int length = markdown.length + 1;
    
    ib = bufnew(length);
    bufgrow(ib, length);    
    memcpy(ib->data,prose,length);
    ib->size = length;
    
    ob = bufnew(64);

    ob->size = 0;
    
    upshtml_renderer(&renderer, 0);
    ups_markdown(ob, ib, &renderer, ~0);
    upshtml_free_renderer(&renderer);
    
	NSString *html = [NSString stringWithUTF8String: ob->data];
    
	/* cleanup */
	bufrelease(ib);
	bufrelease(ob);
    
    return html;
}

@end
