const jwt= require('jsonwebtoken')
const admin= async (req,res,next)=>{
    try{
        const token= req.header('x-auth-token');
        if(!token)   return res.status(401).json({msg:"No auth Token,Acess Denied"});

        const  valid=jwt.verify(token,'passwordKey');
        if(!valid)  return  res.status(401).json({msg:'Token Verification Failed'});

        req.user=valid.id;
        req.token=token;
        next();
    }
    catch(e){
        res.status(500).json({ error: e.message });
    }
}
module.exports=admin;