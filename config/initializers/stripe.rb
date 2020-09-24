Rails.configuration.stripe = {
    :publishable_key => 'pk_test_51HTYAWBg8mCs9xMbq8aUaH7ejcNt1OIunRiGFoOBLWXFR1PhTLXiAmSw9kUfWu9SAmEx1z5wGN6XwNDZ49UAHMXC00ORVSBwBh',
    :secret_key => 'sk_test_51HTYAWBg8mCs9xMbKUQ3nCw84F4R9SCWKSfW0dX10g9oytCuORIyEhiODejMljj1XPt5wvKTcHI6XSP7DBRinTVk00XPoHYyjN'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]