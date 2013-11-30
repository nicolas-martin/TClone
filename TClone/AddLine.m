//
// Created by Nicolas Martin on 11/30/2013.
//


#import "AddLine.h"
#import "Field.h"
#import "Board.h"

#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

@implementation AddLine {

}


- (AddLine *)initWith {
    self = [super init];
    if (self) {

    }

    return self;
}

+ (AddLine *)initStuff {
    return [[self alloc] initWith];
}

- (NSString *)spellName {
    return @"AddLine";
}

- (void)CreateBlockLine{
    NSMutableArray *bArray = [NSMutableArray array];

    for (NSUInteger x = 0; x < _targetField.board.Nbx; x++) {
        NSUInteger random = arc4random();

        if ((random % 3) > 0)
        {
            Block *block = [Block newEmptyBlockWithColorByType:random % 7];
            [block setBoardX:x];
            [block setBoardY:19];

            [bArray addObject:block];
        }

    }

    [_targetField addBlocks:bArray];
}

- (void)CastSpell {
    NSLog(@"ADD LINE CALLED!!!!!!");

    Board *board = _targetField.board;

    NSMutableArray *blocksToSetPosition = [NSMutableArray array];

    for (NSUInteger y = 0; y < board.Nby; y++) {
        for (NSUInteger x = 0; x < board.Nbx; x++) {
            Block *current = [board getBlockAt:ccp(x, y)];
            if (current != nil) {

                [board MoveBlock:current to:ccp(x, y - 1)];

                [current moveUp];

                [blocksToSetPosition addObject:current];

            }
        }
    }

    [_targetField setPositionUsingFieldValue:blocksToSetPosition];

    [self CreateBlockLine];


}

- (NSString *)LogSpell {
    NSString *Output = [NSString stringWithFormat:@"%@ was casted on %@", _spellName, _targetField.Name];
    return Output;
}


@end