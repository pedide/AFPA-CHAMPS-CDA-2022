import { Produit } from './product/product';

// eslint-disable-next-line @typescript-eslint/naming-convention
export interface itemCart{
    item: Produit;
    qty: number;
    amount: number;

}
