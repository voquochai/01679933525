"use strict";
/** @module stringProcessing/findKeywordInUrl */

var matchTextWithTransliteration = require("./matchTextWithTransliteration.js");
var escapeRegExp = require("lodash/escapeRegExp");
/**
 * Matches the keyword in the URL.
 *
 * @param {string} url The url to check for keyword
 * @param {string} keyword The keyword to check if it is in the URL
 * @param {string} locale The locale used for transliteration.
 * @returns {boolean} If a keyword is found, returns true
 */
module.exports = function (url, keyword, locale) {
    var formatUrl = url.match(/>(.*)/ig);
    keyword = escapeRegExp(keyword);
    if (formatUrl !== null) {
        formatUrl = formatUrl[0].replace(/<.*?>\s?/ig, "");
        return matchTextWithTransliteration(formatUrl, keyword, locale).length > 0;
    }
    return false;
};
//# sourceMappingURL=findKeywordInUrl.js.map
//# sourceMappingURL=findKeywordInUrl.js.map
