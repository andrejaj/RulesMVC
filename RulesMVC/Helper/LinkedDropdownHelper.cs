using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc;

namespace RulesMVC.Helper
{
    public static class LinkedDropdownHelper
    {

        public static MvcHtmlString LinkedDropdownListFor<TModel, TProperty>(this HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TProperty>> expression, string parent, IEnumerable<LinkedSelectListItem> selectList)
        {
            string propertyName = ((MemberExpression)expression.Body).Member.Name;

            TagBuilder select = new TagBuilder("select");
            select.Attributes.Add("id", propertyName);
            select.Attributes.Add("name", propertyName);
            select.Attributes.Add("class", "linked-dropdown");
            select.Attributes.Add("data-parent", parent);

            foreach (var item in selectList)
            {
                TagBuilder option = new TagBuilder("option");
                option.InnerHtml = item.Text;
                option.Attributes.Add("value", item.Value);
                option.Attributes.Add("data-parentvalue", item.LinkValue);

                if (item.Selected)
                {
                    option.Attributes.Add("selected", "selected");
                }
                select.InnerHtml += option.ToString(TagRenderMode.Normal);
            }

            const string script = @"<script type='text/javascript'>$(document).ready(function () {
                $('#' + $('.linked-dropdown').attr('data-parent')).unbind('change.linked-dropdown');

                $('.linked-dropdown').each(function () {
                  var $linked = $(this);

                  $('#' + $linked.attr('data-parent')).bind('change.linked-dropdown', function () {
                    var parentid = $(this).find('option:selected').val();

                    $linked.find('option').hide();
                    $linked.find('option[data-parentvalue=' + parentid + ']').show();
                    $linked.find('option:visible:first').attr('selected', 'selected');
                  });

                  $('#' + $linked.attr('data-parent')).change();
                });
              });</script>";

            return MvcHtmlString.Create(script + select.ToString(TagRenderMode.Normal));
        }
    }
}