#!/usr/bin/env python

from random import randint

def get_word():
    letters = list('abcdefghijklmnopqrstuvwxyz')
    size = randint(4, 10)
    word = list()
    for i in range(size):
        c = randint(0, len(letters) - 1)
        word.append(letters[c])
    word.append(' ')
    return ''.join(word)

def write(source, size):
    with open(source, 'w') as f:
        for i in range(size):
            f.write(get_word())
    return

def read(source):
    with open(source, 'r') as f:
        lines = f.readlines()
    words = lines[0].split()
    print('read {} words'.format(len(words)))
    return

def main():
    source = 'noise.txt'
    words = 1000000
    write(source, words)
    read(source)
    return 

if __name__ == '__main__':
    main()
