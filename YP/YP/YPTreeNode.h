//
//  YPTreeNode.h
//  YP
//
//  Created by syp on 15/11/14.
//  Copyright © 2015年 syp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YPCore.h"

@interface YPTreeNode : NSObject

readonlyProperty YPTreeNode *root;
weakProperty YPTreeNode *parent;
weakProperty YPTreeNode *prev;
weakProperty YPTreeNode *next;
strongProperty NSMutableArray *childs;

+ (instancetype)treeNode;

- (instancetype)createChild;
- (instancetype)createChild:(Class)nodeClass;

- (instancetype)createSibling;
- (instancetype)createSibling:(Class)nodeClass;

- (void)appendNode:(YPTreeNode *)node;
- (void)insertNode:(YPTreeNode *)node beforeNode:(YPTreeNode *)oldNode;
- (void)insertNode:(YPTreeNode *)node afterNode:(YPTreeNode *)oldNode;
- (void)changeNode:(YPTreeNode *)node withNode:(YPTreeNode *)newNode;
- (void)removeNode:(YPTreeNode *)node;
- (void)removeAllNodes;

@end