React = require('react')
Router = require('react-router')
Link = React.createFactory Router.Link
MomentDisplay = React.createFactory require('./MomentDisplay')
Paths = require('antwar-core/PathsMixin')
SectionLink = React.createFactory require('antwar-core/SectionLink')
config = require 'config'
_ = require('lodash')

{ div, li, p, ul, h1, h3, span } = require 'react-coffee-elements'

module.exports = React.createClass

    displayName: 'SectionIndex'

    mixins: [
        Router.State
        Paths
    ]

    render: ->
        div {className: 'grid'},
            h1 @getSectionTitle() or 'Articles'
            ul { className: 'post-list'},
                _.map @getSectionItems(), (item) =>
                    li key: item.url,
                        h3 {className: 'post-list__heading'},
                            SectionLink
                                item: item
                            , item.title
                            if item.isDraft then span className: 'draft-text', ' Draft'
                        if item.date
                            MomentDisplay
                                datetime: item.date
                        p {className: 'post-list__preview'},
                            item.preview
