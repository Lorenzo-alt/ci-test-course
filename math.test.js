import test from 'node:test';
import assert from 'node:assert/strict';
import { soma } from './index.js';

test('Deve somar 10 + 10 e retornar 20', () => {
  assert.strictEqual(soma(10, 10), 20);
});

test('Deve somar -5 + 5 e retornar 0', () => {
  assert.strictEqual(soma(-5, 5), 0);
});