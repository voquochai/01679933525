"use strict";

var isEmpty = require("lodash/isEmpty");
var forEach = require("lodash/forEach");
var includes = require("lodash/includes");
/**
 * Checks whether a given word is directly preceded by a word from a list of words.
 *
 * @param {Array} precedingWords The array of objects with matches and indices.
 * @param {number} matchIndex The index of the word for which to check whether it's preceded by one of the other words.
 * @param {boolean} addSpace True if a space should be added.
 *
 * @returns {boolean} Returns true if the match is preceded by a given word, otherwise returns false.
 */
module.exports = function (precedingWords, matchIndex) {
    var addSpace = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : true;

    /*
    1 if there is a space between the match and the preceding word
    (because the end word boundary is not included in the match).
    0 if the preceding word is a contraction.
    */
    var space = addSpace ? 1 : 0;
    if (isEmpty(precedingWords)) {
        return false;
    }
    var precedingWordsEndIndices = [];
    forEach(precedingWords, function (precedingWord) {
        var precedingWordsEndIndex = precedingWord.index + precedingWord.match.length + space;
        precedingWordsEndIndices.push(precedingWordsEndIndex);
    });
    return includes(precedingWordsEndIndices, matchIndex);
};
//# sourceMappingURL=includesIndex.js.map
//# sourceMappingURL=includesIndex.js.map
