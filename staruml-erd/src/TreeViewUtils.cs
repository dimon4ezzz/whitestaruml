using System.Collections.Generic;
using System.Windows.Forms;

namespace Erd
{
    /// <summary>
    /// Utility functions to manipulate TreeView storing IUMLPackage related nodes
    /// </summary>
    static class TreeViewUtils
    {

        /// <summary>
        /// Empties and fills tree with top level nodes
        /// </summary>
        /// <param name="nodeCollection">Tree node collection</param>
        internal static void CreateTopLevelNodes(TreeNodeCollection nodeCollection)
        {
            nodeCollection.Clear();
            List<WhiteStarUML.IUMLPackage> packageNodes = ProjectManagerHandler.Instance.GetOwnedPackages();

            foreach (var topPackage in packageNodes)
            {
                TreeNode topNode = TreeViewUtils.CreateNode(topPackage);
                nodeCollection.Add(topNode);
                CreateChildNodes(topNode);
            }
        }

        /// <summary>
        /// Updates tree view starting from given node
        /// </summary>
        /// <param name="parentNode">Starting node</param>
        internal static void UpdateTreeView(TreeNode parentNode)
        {
            // process top node
            List<TreeNode> childNodes = new List<TreeNode>();
            CreateChildNodes(parentNode, childNodes);

            // process direct children
            foreach (var childNode in childNodes)
            {
                CreateChildNodes(childNode, null);
            }
        }

        /// <summary>
        /// Creates tree node encapsulating IUMLPackage object
        /// </summary>
        /// <param name="package">Encapsulated data</param>
        /// <returns></returns>
        private static TreeNode CreateNode(WhiteStarUML.IUMLPackage package)
        {
            TreeNode node = new TreeNode(package.Name);
            node.Tag = package;
            return node;
        }

        /// <summary>
        /// Fills tree view with children of given package
        /// </summary>
        /// <param name="parentNode">Starting node</param>
        /// <param name="childNodes">Container for created nodes for recursive processing, null if not required</param>
        private static void CreateChildNodes(TreeNode parentNode, List<TreeNode> childNodes = null)
        {
            // Create list of child nodes
            WhiteStarUML.IUMLPackage parentPackage = (WhiteStarUML.IUMLPackage)parentNode.Tag;
            List<WhiteStarUML.IUMLPackage> packageNodes = ProjectManagerHandler.Instance.GetOwnedPackages(parentPackage);

            parentNode.Nodes.Clear();

            // Process child nodes
            foreach (var package in packageNodes)
            {
                // Create and add child node
                TreeNode newNode = CreateNode(package);
                parentNode.Nodes.Add(newNode);
                if (childNodes != null)
                    childNodes.Add(newNode); // Collecting children
                else // It is a grand child of initial node
                    break; // One grand child node is enough to mark parent as expandable
            }
        }

    }
}
