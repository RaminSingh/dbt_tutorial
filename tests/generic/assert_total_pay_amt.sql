{% test pay_amount(model,column_name) %}

    with validation as (
        SELECT 
            {{column_name}} AS PAY_AMOUNT
        FROM {{model}}


    ),

    validation_error as (

        SELECT 
            PAY_AMOUNT
        FROM validation
        WHERE PAY_AMOUNT < 0

    )

    SELECT * FROM validation_error
        

{% endtest %}

{% test pay_amount_zero(model,column_name) %}

    {{config(severity='warn')}}

    with validation as (
        SELECT 
            {{column_name}} AS PAY_AMOUNT
        FROM {{model}}


    ),

    validation_error as (

        SELECT 
            PAY_AMOUNT
        FROM validation
        WHERE PAY_AMOUNT = 0

    )

    SELECT * FROM validation_error
    

{% endtest %}