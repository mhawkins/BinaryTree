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
    self = [self initWithValue:0.0f];
    return self;
}

-(id)initWithValue:(float)value
{
    self = [self initWithValue:value andLeftNode:nil andRightNode:nil];
    return self;
}

-(id)initWithValue:(float)value andLeftNode:(Node *)leftNode andRightNode:(Node *)rightNode
{
    self = [super init];
    if(self)
    {
        self.value = value;
        self.leftNode = leftNode;
        self.rightNode = rightNode;
    }
    
    return self;
}

#pragma mark - Override
-(NSString *)description
{
    return [NSString stringWithFormat:@"['%@' '%0.2f']", [super description], self.value];
}


#pragma mark - Properties
-(float)sum
{
    float sum = self.value;
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

-(Node *)largestNode
{
    return [self nodeForComparisonResult:NSOrderedAscending];
}

-(Node *)smallestNode
{
    return [self nodeForComparisonResult:NSOrderedDescending];
}

#pragma mark - Instance variables
-(BOOL)containsNodeWithValue:(float)data
{
    if(self.value == data)
        return YES;
    
    if(self.leftNode && [self.leftNode containsNodeWithValue:data])
        return YES;
    
    if(self.rightNode && [self.rightNode containsNodeWithValue:data])
        return YES;
    
    return NO;
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

-(Node *)findNodeWithValue:(float)value
{
    if(self.value == value)
        return self;
    
    if(self.leftNode)
    {
        Node *leftNodeResult = [self.leftNode findNodeWithValue:value];
        if(leftNodeResult)
            return leftNodeResult;
    }
    
    if(self.rightNode)
    {
        Node *rightNodeResult = [self.rightNode findNodeWithValue:value];
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

-(NSString *)stringPrefixOrder
{
    NSMutableString *result = [NSMutableString string];
    
    [result appendFormat:@" %@ ", self.description];
    
    if(self.leftNode)
    {
        NSString *leftString = [self.leftNode stringPrefixOrder];
        [result appendString:leftString];
    }
    
    if(self.rightNode)
    {
        NSString *rightString = [self.rightNode stringPrefixOrder];
        [result appendString:rightString];
    }
    
    return result;
}
-(NSString *)stringInfixOrder
{
    NSMutableString *result = [NSMutableString string];
    
    if(self.leftNode)
    {
        NSString *leftString = [self.leftNode stringInfixOrder];
        [result appendString:leftString];
    }
    
    [result appendFormat:@" %@ ", self.description];
    
    if(self.rightNode)
    {
        NSString *rightString = [self.rightNode stringInfixOrder];
        [result appendString:rightString];
    }
    
    return result;    
}


-(NSString *)stringPostfixOrder
{
    NSMutableString *result = [NSMutableString string];
    
    if(self.leftNode)
    {
        NSString *leftString = [self.leftNode stringPostfixOrder];
        [result appendString:leftString];
    }
    
    if(self.rightNode)
    {
        NSString *rightString = [self.rightNode stringPostfixOrder];
        [result appendString:rightString];
    }
    
    [result appendFormat:@" %@ ", self.description];
    
    return result;
}


#pragma mark - Comparison
-(NSComparisonResult)compare:(Node *)object
{
    if(self.value > object.value)
        return NSOrderedDescending;
    else if(self.value < object.value)
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
