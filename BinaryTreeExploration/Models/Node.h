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
@property(nonatomic,assign) float data;
@property(nonatomic,readonly) float sum;

// Initializers
-(id)initWithData:(float)data;
-(id)initWithData:(float)data andLeftNode:(Node *)leftNode andRightNode:(Node *)rightNode;

// Instance methods
-(BOOL)containsData:(float)data;
-(Node *)largestNode;
-(Node *)smallestNode;
-(Node *)findNodeWithData:(float)data;

// informal protocol
-(NSComparisonResult)compare:(Node *)object;

@end
