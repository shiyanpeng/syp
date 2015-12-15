//
//  YPPropertyMacro.h
//  YP
//
//  Created by syp on 15/10/28.
//  Copyright © 2015年 syp. All rights reserved.
//

#import <Foundation/Foundation.h>


#define	readonlyProperty		@property (nonatomic, readonly)
#define	assignProperty         @property (nonatomic, assign)
#define	strongProperty         @property (nonatomic, strong)
#define	weakProperty			@property (nonatomic, weak)
#define	copyProperty			@property (nonatomic, copy)

#define	readonlyAtomicProperty          @property (nonatomic, readonly)
#define	assignAtomicProperty		    @property (nonatomic, assign) type_name
#define	strongAtomicProperty		    @property (nonatomic, strong) type_name
#define	weakAtomicProperty              @property (nonatomic, weak) type_name
#define	copyAtomicProperty              @property (nonatomic, copy) type_name
