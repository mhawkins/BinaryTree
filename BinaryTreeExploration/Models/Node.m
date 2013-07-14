//
//  Node.m
//  BinaryTreeExploration
//
//  Created by Matt Hawkins on 7/14/13.
//  Copyright (c) 2013 Matt Hawkins. All rights reserved.
//

#import "Node.h"

@interface Node()
-(Node *)nodeForComparisonResult:(NSComparisonResult)comparisonResult;
@end

@implementation Node

#pragma mark - Initializers
-(id)init
{
    self = [self initWithData:0.0f];
    return self;
}

-(id)initWithData:(float)data
{
    self = [self initWithData:data andLeftNode:nil andRightNode:nil];
    return self;
}

-(id)initWithData:(float)data andLeftNode:(Node *)leftNode andRightNode:(Node *)rightNode
{
    self = [super init];
    if(self)
    {
        self.data = data;
        self.leftNode = leftNode;
        self.rightNode = rightNode;
    }
    
    return self;
}

#pragma mark - Override
-(NSString *)description
{
    return [NSString stringWithFormat:@"[Node  '%0.2f']", self.data];
}


#pragma mark - Properties
-(float)sum
{
    float sum = self.data;
    if(self.leftNode)
    {
        sum += [self.leftNode sum];
    }
    if(self.rightNode)
    {
        sum += [self.rightNode sum];
    }
         
    return sum;
}

#pragma mark - Instance variables
-(BOOL)containsData:(float)data
{
    if(self.data == data)
        return YES;
    
    if(self.leftNode && [self.leftNode containsData:data])
        return YES;
    
    if(self.rightNode && [self.rightNode containsData:data])
        return YES;
    
    return NO;
}

-(Node *)largestNode
{
    return [self nodeForComparisonResult:NSOrderedAscending];
}

-(Node *)smallestNode
{
    return [self nodeForComparisonResult:NSOrderedDescending];
}

-(int)balance
{
    int balance = 0;
    
    if(self.leftNode)
    {
        balance -= 1;
        balance += [self.leftNode balance];
    }
    
    if(self.rightNode)
    {
        balance += 1;
        balance += [self.leftNode balance];
    }
    
    return balance;
}

-(Node *)findNodeWithData:(float)data
{
    if(self.data == data)
        return self;
    
    if(self.leftNode)
    {
        Node *leftNodeResult = [self.leftNode findNodeWithData:data];
        if(leftNodeResult)
            return leftNodeResult;
    }
    
    if(self.rightNode)
    {
        Node *rightNodeResult = [self.rightNode findNodeWithData:data];
        if(rightNodeResult)
            return rightNodeResult;
    }
    
    return nil;
}

-(void)reverse
{
    if(self.leftNode)
        [self.leftNode reverse];
    
    if(self.rightNode)
        [self.rightNode reverse];
    
    Node *tempLeft = self.leftNode;
    Node *tempRight = self.rightNode;
    self.leftNode = tempRight;
    self.rightNode = tempLeft;
}

-(NSString *)stringInOrder
{
    NSMutableString *result = [NSMutableString string];
    
    if(self.leftNode)
    {
        NSString *leftString = [self.leftNode stringInOrder];
        [result appendString:leftString];
    }
    
    [result appendFormat:@" %0.2f ", self.data];
    
    if(self.rightNode)
    {
        NSString *rightString = [self.rightNode stringInOrder];
        [result appendString:rightString];
    }
    
    return result;    
}

#pragma mark - Comparison
-(NSComparisonResult)compare:(Node *)object
{
    if(self.data > object.data)
        return NSOrderedDescending;
    else if(self.data < object.data)
        return NSOrderedAscending;
    else
        return NSOrderedSame;
}

#pragma mark - Private
-(Node *)nodeForComparisonResult:(NSComparisonResult)comparisonResult
{
    Node *targetNode = self;
    if(self.leftNode)
    {
        Node *leftNodeResult = [self.leftNode nodeForComparisonResult:comparisonResult];
        if([targetNode compare:leftNodeResult] == comparisonResult)
            targetNode = leftNodeResult;
    }
    if(self.rightNode)
    {
        Node *rightNodeResult = [self.leftNode nodeForComparisonResult:comparisonResult];
        if([targetNode compare:rightNodeResult] == comparisonResult)
            targetNode = rightNodeResult;
    }
    
    return targetNode;
}

@end
