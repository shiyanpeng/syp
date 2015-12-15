//
//  YPTreeNode.m
//  YP
//
//  Created by syp on 15/11/14.
//  Copyright © 2015年 syp. All rights reserved.
//

#import "YPTreeNode.h"

@implementation YPTreeNode

- (id)init
{
    self = [super init];
    if (self) {
        self.childs = [NSMutableArray array];
    }
    return self;
}

#pragma mark -

+ (instancetype)treeNode
{
    return [[self alloc] init];
}

- (YPTreeNode *)root
{
    YPTreeNode *root = self.parent;
    while (root) {
        root = root.parent;
    }
    return root;
}

#pragma mark -

- (instancetype)createChild
{
    return [self createChild:[self class]];
}

- (instancetype)createChild:(Class)nodeClass
{
    YPTreeNode *node = [[nodeClass alloc] init];
    [self appendNode:node];
    return node;
}

- (instancetype)createSibling
{
    return [self createSibling:[self class]];
}

- (instancetype)createSibling:(Class)nodeClass
{
    YPTreeNode *node = [[nodeClass alloc] init];
    
    node.parent = self.parent;
    node.prev = self;
    node.next = nil;
    
    //	[node relation]
    //	prev self -> *node
    
    self.next = node;
    
    [self.parent.childs addObject:node];
    
    return node;
}

#pragma mark -

- (void)appendNode:(YPTreeNode *)node
{
    if (nil == node) {
        return;
    }
    
    if ([self.childs containsObject:node]) {
        return;
    }
    
    node.parent = self;
    node.prev = [self.childs lastObject];
    node.next = nil;
    node.prev.next = node;
    [self.childs addObject:node];
}

- (void)insertNode:(YPTreeNode *)node beforeNode:(YPTreeNode *)oldNode
{
    if (nil == node || nil == oldNode) {
        return;
    }
    if ([self.childs containsObject:node] )
        return;
    
    if ( NO == [self.childs containsObject:oldNode] )
        return;
    
    node.prev = oldNode.prev;
    node.next = oldNode;
    node.parent = self;
    
    oldNode.prev.next = node;
    oldNode.prev = node;
    
    [self.childs addObject:node];
}

- (void)insertNode:(YPTreeNode *)node afterNode:(YPTreeNode *)oldNode
{
    if ( nil == node )
        return;
    
    if ( [self.childs containsObject:node] )
        return;
    
    if ( NO == [self.childs containsObject:oldNode] )
        return;
    
    node.prev = oldNode;
    node.next = oldNode.next;
    node.parent = self;
    
    oldNode.next.prev = node;
    oldNode.next = node;
    
    [self.childs addObject:node];
}

- (void)changeNode:(YPTreeNode *)node withNode:(YPTreeNode *)newNode
{
    if ( nil == node || nil == newNode )
        return;
    
    if ( NO == [self.childs containsObject:node] )
        return;
    
    newNode.parent = node.parent;
    newNode.prev = node.prev;
    newNode.next = node.next;
    
    node.parent = nil;
    node.prev = nil;
    node.next = nil;
    
    [self.childs replaceObjectAtIndex:[self.childs indexOfObject:node] withObject:newNode];
}

- (void)removeNode:(YPTreeNode *)node
{
    if ( nil == node )
        return;
    
    if ( NO == [self.childs containsObject:node] )
        return;
    
    if ( node.prev )
    {
        node.prev.next = node.next;
    }
    
    if ( node.next )
    {
        node.next.prev = node.prev;
    }
    
    node.parent = nil;
    node.prev = nil;
    node.next = nil;
    
    [self.childs removeObject:node];
}

- (void)removeAllNodes
{
    for ( YPTreeNode * node in self.childs )
    {
        node.parent = nil;
        node.prev = nil;
        node.next = nil;		
    }
    
    [self.childs removeAllObjects];
}

@end
