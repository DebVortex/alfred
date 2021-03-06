import re

import wikipedia

from ariane.apps.core import register

language_translate = {
    'en-GB': 'en',
    'de-DE': 'de'
}


@register('wikipedia')
def get_wiki_article(ariane, wit_resp):
    """Test func."""
    wikipedia.set_lang(language_translate[ariane.language])
    result = wikipedia.summary(
        wit_resp['entities']['wikipedia_search_query'][0]['value'],
        sentences=4
    )
    msg = {
        "ariane.message": result,
        "ariane.say": re.sub("[\(\[].*?[\)\]]", "", result)
    }
    return msg
