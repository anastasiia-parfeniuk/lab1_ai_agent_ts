import { describe, expect, it } from "vitest";
import { BasicAddition } from "../src/math";

describe("BasicAddition", () => {
  it("adds two positive numbers", () => {
    expect(BasicAddition(2, 3)).toBe(5);
  });

  it("adds a negative number", () => {
    expect(BasicAddition(-2, 5)).toBe(3);
  });

  it("returns the same value when adding zero", () => {
    expect(BasicAddition(7, 0)).toBe(7);
  });

  it("adds two negative numbers", () => {
    expect(BasicAddition(-4, -6)).toBe(-10);
  });
});
