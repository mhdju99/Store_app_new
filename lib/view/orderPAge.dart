import 'package:flutter/material.dart';


class orderPge extends StatelessWidget {


  const orderPge();

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return Container(
        padding: EdgeInsets.all(6),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: _theme.primaryColor.withOpacity(0.3),
                // blurRadius: AppSizes.imageRadius,
              )
            ],
            // borderRadius: BorderRadius.circular(AppSizes.imageRadius)
            // color: AppColors.white,
          ),
          child: Padding(
            padding: EdgeInsets.all(2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: 'Order: ',
                        // style: _theme.textTheme.headline4?,
                      ),
                      TextSpan(
                        text: '#' + "213",
                        // style: _theme.textTheme.headline4
                           
                      ),
                    ])),
                    Text("123123/32/2",
                       
                            )
                  ],
                ),
                SizedBox(
                  height:3,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Tacking Number: ',
                      
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 6),
                          child: Text(
                            "44",
                            // style: _theme.textTheme.headline4,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Quantity: ',
                      
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 3),
                              child: Text(
                               "33",
                                // style: _theme.textTheme.headline4,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Totat Amount: ',
                            
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 3),
                              child: Text(
                                '\$' + "222",
                                //total amount
                                // style: _theme.textTheme.headline4,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MaterialButton(
                      padding: EdgeInsets.only(
                          left: 24, right: 24, top: 10, bottom: 10),
                      color: Colors.white,
                      onPressed: () {
                        // onClick(order.id);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(3),
                          side: BorderSide(color: Colors.black, width: 2)),
                      child: Text(
                        'Details',
                        // style: _theme.textTheme.headline4,
                      ),
                    ),
                    Text("wewe",
                      ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

}
