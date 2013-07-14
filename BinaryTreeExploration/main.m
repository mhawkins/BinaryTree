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
    
    NSLog(@"%@Node at depth '%i' with value '%0.2f'", padding, depth, node.data);
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
        Node *node1 = [[Node alloc] initWithData:1.0f andLeftNode:nil andRightNode:nil];
        Node *node2 = [[Node alloc] initWithData:2.0f andLeftNode:nil andRightNode:nil];
        Node *node3 = [[Node alloc] initWithData:3.0f andLeftNode:nil andRightNode:nil];
        Node *node4 = [[Node alloc] initWithData:4.0f andLeftNode:nil andRightNode:nil];
        Node *node13 = [[Node alloc] initWithData:13.0f andLeftNode:node1 andRightNode:node3];
        Node *node24 = [[Node alloc] initWithData:24.0f andLeftNode:node2 andRightNode:node4];
        Node *nodeParent = [[Node alloc] initWithData:1234.0f andLeftNode:node13 andRightNode:node24];
        
        NSLog(@"Size of node class %lu", class_getInstanceSize([Node class]));
        NSLog(@"Size of NSObject class %lu", class_getInstanceSize([NSObject class]));
        NSLog(@"Size of float %lu", sizeof(float));
                
        NSLog(@"Sum of the tree - %0.2f", nodeParent.sum);
        NSLog(@"Contains 13 (should be true) - %i", [nodeParent containsData:13.0f]);
        NSLog(@"Contains 17 (should be false) - %i", [nodeParent containsData:17.0f]);
        NSLog(@"Largest node - %@", [nodeParent largestNode]);
        NSLog(@"Smallest node - %@", [nodeParent smallestNode]);
        NSLog(@"Node with value 3 - %@", [nodeParent findNodeWithData:3.0f]);
        
        
    }
    return 0;
}



