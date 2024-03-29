//
//  main.m
//  BinaryTreeExploration
//
//  Created by Matt Hawkins on 7/14/13.
//  Copyright (c) 2013 Matt Hawkins. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Node.h"
#import <objc/runtime.h>

void printNode(Node *node, int depth) {
    NSString *padding = [@"" stringByPaddingToLength:depth withString:@" " startingAtIndex:0];
    if(depth > 0)
    {
        padding = [padding stringByAppendingString:@"\\"];
    }
    
    NSLog(@"%@Node at depth '%i' with value '%0.2f'", padding, depth, node.value);
    if(node.leftNode)
    {
        printNode(node.leftNode, depth+1);
    }
    if(node.rightNode)
    {
        printNode(node.rightNode, depth+1);
    }
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Create a binary tree
        Node *node1 = [[Node alloc] initWithValue:1.0f andLeftNode:nil andRightNode:nil];
        Node *node2 = [[Node alloc] initWithValue:2.0f andLeftNode:nil andRightNode:nil];
        Node *node3 = [[Node alloc] initWithValue:3.0f andLeftNode:nil andRightNode:nil];
        Node *node4 = [[Node alloc] initWithValue:4.0f andLeftNode:nil andRightNode:nil];
        Node *node13 = [[Node alloc] initWithValue:13.0f andLeftNode:node1 andRightNode:node3];
        Node *node24 = [[Node alloc] initWithValue:24.0f andLeftNode:node2 andRightNode:node4];
        Node *nodeParent = [[Node alloc] initWithValue:1234.0f andLeftNode:node13 andRightNode:node24];
        
        NSLog(@"Size of node class %lu", class_getInstanceSize([Node class]));
        NSLog(@"Size of NSObject class %lu", class_getInstanceSize([NSObject class]));
        NSLog(@"Size of float %lu", sizeof(float));
                
        NSLog(@"Sum of the tree - %0.2f", nodeParent.sum);
        NSLog(@"Contains 13 (should be true) - %i", [nodeParent containsNodeWithValue:13.0f]);
        NSLog(@"Contains 17 (should be false) - %i", [nodeParent containsNodeWithValue:17.0f]);
        NSLog(@"Largest node - %@", [nodeParent largestNode]);
        NSLog(@"Smallest node - %@", [nodeParent smallestNode]);
        NSLog(@"Node with value 3 - %@", [nodeParent findNodeWithValue:3.0f]);
        
        
        NSLog(@"Tree in order (prefix)... '%@'", [nodeParent stringPrefixOrder]);
        NSLog(@"Tree in order (infix)... '%@'", [nodeParent stringInfixOrder]);
        NSLog(@"Tree in order (postfix)... '%@'", [nodeParent stringPostfixOrder]);

        NSLog(@"Tree hierarchy...");
        printNode(nodeParent, 0);

        NSLog(@"Tree hierarchy after reversal...");
        [nodeParent reverse];
        printNode(nodeParent, 0);
        
        
        
    }
    return 0;
}



