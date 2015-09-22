using System.Text.RegularExpressions;

namespace Erd
{
    /// <summary>
    /// General utils
    /// </summary>
    internal static class GeneralUtils
    {
        /// <summary>
        /// Validates if string contains valid characters
        /// </summary>
        /// <param name="name">Tested string</param>
        /// <returns>True if string is conformant</returns>
        internal static bool ValidateName(string name)
        {
            Regex rgx = new Regex(Symbols.REGEX_PATTERN_VALID_NAME, RegexOptions.IgnoreCase);
            return rgx.IsMatch(name);
        }
    }
}
