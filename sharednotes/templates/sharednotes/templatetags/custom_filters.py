from django import template

register = template.Library()

@register.filter
def endswith(value, suffix):
    """Retorna True se o valor terminar com o sufixo informado."""
    try:
        return str(value).lower().endswith(str(suffix).lower())
    except Exception:
        return False
