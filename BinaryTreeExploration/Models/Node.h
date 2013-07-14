//
//  Node.h
//  BinaryTreeExploration
//
//  Created by Matt Hawkins on 7/14/13.
//  Copyright (c) 2013 Matt Hawkins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject
{
    
}
@property(nonatomic,weak) Node *leftNode;
@property(nonatomic,weak) Node *rightNode;
@property(nonatomic,assign) float value;
@property(nonatomic,readonly) float sum;
@property(nonatomic,readonly) Node * smallestNode;
@property(nonatomic,readonly) Node * largestNode;

// Initializers
-(id)initWithValue:(float)value;
-(id)initWithValue:(float)value andLeftNode:(Node *)leftNode andRightNode:(Node *)rightNode;

// Instance methods
-(BOOL)containsNodeWithValue:(float)value;
-(Node *)findNodeWithValue:(float)value;
-(int)balance;
-(void)reverse;
-(NSString *)stringPrefixOrder;
-(NSString *)stringInfixOrder;
-(NSString *)stringPostfixOrder;

// informal protocol
-(NSComparisonResult)compare:(Node *)object;

@end
